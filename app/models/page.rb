class HomeRequester
	include ModelHelper
	def initialize(user_id)
		@user = User.find(user_id)
		@shoplist = []
		build
	end

	def build()
		sls = Shoplist.where("request_id = ?", u.id)
		sls.each do |sl|
			add_shoplist(sl)
		end
	end

	def add_shoplist(sl)
		product_items = ProductItem.where("shoplist_id = ?", sl.id)
		h = clean_record(sl)
		h["helper"] = add_helper(sl)
		list = []
		product_items.each do |pi|
			list << add_product(pi)
		end
		h["products"] = list
		h["shoplist_id"] = sl.id
		h["supermarket"] = sl.supermarket
		h["expire_time"] = sl.expire_time
		h["total_price"] = sl.total_price
		h["actual_price"] = sl.actual_price
		h["status"] = sl.status
		h["created_at"] = sl.created_at
		h["updated_at"] = sl.updated_at
	end

	def add_product(product_item)
		h = Hash.new
		h["quantity"] = product_item.quantity
		h["is_bought"] = product_item
	end
end