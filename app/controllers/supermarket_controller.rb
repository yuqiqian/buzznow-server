class SupermarketController < ApplicationController
	include GlobalHelper
	skip_before_filter  :verify_authenticity_token
	def supermarket
		sm = SuperMarket.find(params[:supermarket_id])
		general_return_function("find", sm, "supermarket", sm)
	end

	def new
		sm = SuperMarket.new(supermarket_params)
		general_return_function("save", sm.save, "supermarket")
	end

	def update
		sm = SuperMarket.find(params[:supermarket_id])
		general_return_function("update", sm.update_attributes(supermarket_params), "supermarket")
	end

	def supermarket_params
		params.require(:supermarket).permit(:name, :picture)
	end
end