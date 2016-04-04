class PageController < ApplicationController
	include GlobalHelper

	def home_requester
		u = User.find(params[:user_id])
		res = {}
		shoplists = []
		sls = Shoplist.where("requester_id = ?", u.id)
		sls.each do |sl|
			helper = object2hash(User.find(sl.helper.id))
			product_items = ProductItem.where("shoplist_id = ?", sl.id).map{|pi| object2hash(pi)}
			products = []
			product_items.each do |pi|
				p = object2hash(Product.find(pi["product_id"]))
				pi["product"] = p
				products << pi
			end
			sl["helper"] = helper
			sl["products"] = products
			shoplists << sl
		end
		res["msg"] = "OK"
		res["ret"] = 0
		res["shoplists"] =shoplists
		render json: res
	end

	def home_shopper
		u = User.find(params[:user_id])
		res = {}
		requesters = []
		order_summary = {}
		order_summary["total_orders"] = 0
		order_summary["total_items"] = 0
		order_summary["total_money"] = 0
		order_summary["total_tips"] = 0 # No where include tips information
		sls = Shoplist.where("helper_id = ?", u.id)
		sls.each do |sl|
			reqeuster = object2hash(User.find(sl.requester_id))
			requesters << reqeuster
			order_summary["total_orders"] +=1
			order_summary["total_items"] += ProductItem.where("shoplist_id = ?", sl.id).length
			order_summary["total_money"] += sl.actual_price
		end
		order_summary["requesters"] = requesters
		res["msg"] = "OK"
		res["ret"] = 0
		res["order_summary"] = order_summary
		render json: res
	end

	def select_orders
		sm = Supermarket.where("name = ?", params[:supermarket])
		sls = Shoplist.where("supermarket = ? and expire_time >", params[:supermarket], DateTime.now)
		res = {}
		orders = []
		sls.each do |sl|
			hash = {}
			hash["requester"] = object2hash(User.find(sl.requester_id))
			order = {}
			order["total_money"] = sl.total_money
			order["total_items"] = ProductItem.where(shoplist_id: sl.id).map{|p| p.quantity.to_i}.inject(:+)
			hash["order"] = order
			orders << hash
		end
		res["msg"] = "OK"
		res["ret"] = 0
		res["orders"] = orders
		render json: res
	end

	def shopping_checklist
		sl = Shoplist.find(params[:shoplist_id])
	end
end