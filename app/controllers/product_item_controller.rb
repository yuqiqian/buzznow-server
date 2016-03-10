class ProductItemController < ApplicationController
	include GlobalHelper
	skip_before_filter  :verify_authenticity_token
	def product_item
		pi = ProductItem.find(params[:product_item_id])
		general_return_function("find", pi, "product_item", pi)
	end

	def new
		pi = ProductItem.new(product_item_parameter)
		pd = Product.find(product_item_parameter[:product_id])
		sl = Shoplist.find(product_item_parameter[:shoplist_id])
		pi.product = pd
		pi.shoplist = sl
		general_return_function("save", pi, "product_item")
	end

	def update
		pi = ProductItem.find(params[:product_item_id])
		pd = Product.find(product_item_updatable_parameter[:product_id])
		sl = Shoplist.find(product_item_updatable_parameter[:shoplist_id])
		if pi.update_attributes(product_item_parameter)
			pi.product = pd
			pi.shoplist = sl
			render json: success_return
		else
			render json: fail_update
		end
	end

	def product_item_parameter
		params.require(:product_item).permit(:product_id, :quantity, :is_bought, :shoplist_id)
	end

	def product_item_updatable_parameter
		params.require(:product_item).permit(:product_id, :quantity, :is_bought, :shoplist_id)
	end
end