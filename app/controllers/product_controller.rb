class ProductController < ApplicationController
	include GlobalHelper
	skip_before_filter  :verify_authenticity_token
	def product
		p = Product.find(params[:product_id])
		general_return_function("find", p, "product", p)
	end

	def new
		p = Product.new(product_params)
		general_return_function("save", p.save, "product")
	end

	def update
		#byebug
		p = Product.find(params[:product_id])
		general_return_function("update", p.update_attributes(product_params), "product")
	end

	def product_params
		params.require(:product).permit(:name, :product_img, :price, :category)
	end 
end