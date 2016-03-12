class ShoplistController < ApplicationController
	include GlobalHelper
	skip_before_filter  :verify_authenticity_token
	def shoplist
		sl = Shoplist.find(params[:shoplist_id])
		if sl
			res = success_return
			res["shoplist"] = sl
			render json: res
		else
			render json: fail_find
		end
	end

	def new
		sl = Shoplist.new(shoplist_params)
		requester = User.find(params["shoplist"]["requester_id"])
		helper = User.find(params["shoplist"]["helper_id"])
		sl.requester = requester
		sl.helper = helper
		if sl.save
			res = success_return
			render json: res
		else
			render json: fail_update
		end
	end

	def update
		sl = Shoplist.find(params[:shoplist_id])
		if sl.update_attributes(shoplist_updatable_params)
			res = success_return
			render json: res
		else
			render json: fail_update
		end
	end

	def shoplist_params
    	params.require(:shoplist).permit(:supermarket, :expire_time, :total_price, :actual_price, :status, :receipt)
  	end

  	def shoplist_updatable_params
  		params.require(:shoplist).permit(:supermarket, :expire_time, :total_price, :actual_price, :status, :receipt)
  	end
end