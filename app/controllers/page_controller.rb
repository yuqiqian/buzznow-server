class PageController < ApplicationController
	include GlobalHelper

	def home_requester
		u = User.find(params[:user_id])
		shoplists = []
		
		sls.each do |sl|
			helper = User.find(sl.helper.id)
			product_items = ProductItem.where("shoplist_id = ?", sl.id)
			products = []
			product_items.each do |pi|
				p = pi.product
			end

		end
		render json: shoplists
	end

	def home_shopper
		u = User.find(params[:user_id])
	end

	def select_orders
		sm = Supermarket.where("name = ?", params[:supermarket])
	end

	def shopping_checklist
		sl = Shoplist.find(params[:shoplist_id])
	end
end