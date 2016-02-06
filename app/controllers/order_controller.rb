class OrderController < ApplicationController
  def shoplistSummary
    slid = params[:shoplist]
    @shoplist = Shoplist.find(slid)
    @productitems = ProductItem.where(shoplist: @shoplist)
  end

  def checklist
    slid = params[:shoplist]
    @shoplist = Shoplist.find(slid)
    @productitems = ProductItem.where(shoplist: @shoplist)
  end

  def product_item_update
    @productitem = ProductItem.find(params[:productitem])
    if @productitem.update_attributes(params.require(:productitem).permit(:quantitiy))
      Rails.logger.debug("product item updated")
      return "OK"
    else
      return "Not successful"
    end
  end

  def shop_list_update
    @shoplist = Shoplist.find(params[:shoplist])
    if @shoplist.update_attributes(params.require(:shoplist).permit(:actual_price, :status, :supermarket, :receipt_url))
      Rails.logger.debug("shop list updated")
      return "OK"
    else
      return "Not successful"
    end
  end

  def setOrderStatus
    product_res = product_item_update(params)
    shop_list_res = shop_list_update(params)
    if shop_list_res == "OK" && product_res == "OK"
      return "OK"
    else
      return "Not successful"
    end
  end

  def allShopList
    # Use this when in product
    @shoplists = Shoplist.where(status == "not start")
    @shoplists = Shoplist.all
  end

  def pickShopList
    shoplist = Shoplist.find(params[:shoplist])
    if shoplist.user != nil
      return "Request already picked up!"
    else
      shoplist.helper = current_user
      shoplist.save()
      return "OK"
    end
  end

  def addReceipt
    #Upload picture to server side

    #Update shoplist
  end

  def location
  end
end
