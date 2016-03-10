class ProductController < ApplicationController
	include GlobalHelper
	def product
		p = Product.find(params[:product_id])
		general_return_function("find", p, "product", p)
	end

	def new
		p = Product.new(product_params)
		general_return_function("save", p.save, "product")
	end

	def update
		p = Product.find(params[:product_id])
		general_return_function("update", p.update_attributes(product_params), "product")
	end

	def product_params
		params.require[:product_id].permit(:name, :product_img, :price, :category)
	end 
end