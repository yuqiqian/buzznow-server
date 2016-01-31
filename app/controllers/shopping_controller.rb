class ShoppingController < ApplicationController
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

  def productDetail
  	@product = Product.find(params[:product])
  	if not @product
  		flash[:error] = "No such product"
  	end
  end
end
