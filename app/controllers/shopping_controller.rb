class ShoppingController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def supermarkets
  	@supermarkets = SuperMarket.all
  end

  def products
  	sm = SuperMarket.find(params[:supermarket])
  	if sm
  		@products = sm.products
  	else
  		flash[:error] = "No such supermarket"
  	end
  end

  def makeShopList
  end

  def productDetail
  	@product = Product.find(params[:product])
  	if not @product
  		flash[:error] = "No such product"
  	end
  end

  def product_item_param
    params.require(:productitems).permit(:product, :quantity)
  end
end
