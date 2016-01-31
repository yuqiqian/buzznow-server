class UserController < ApplicationController
  def info
  	gtId = params[:gtid]
  	@user = User.where(gt_id: gtId)[0]
  	@profile = @user.user_profile
  end

  def history
  	gtId = params[:gtid]
  	@user = User.where(gt_id: gtId)[0]
  	@sendReq = Shoplist.where(requester: @user)
  	@helpers = []
  	@sendReq.each do |sr|
  		@helpers << sr.helper
  	end
  	@requesters = []
  	@recvReq = Shoplist.where(helper: @user)
  	@recvReq.each do |rr|
  		@requesters << rr.requester
  	end
  	@onGoing = @recvReq.where(status: "incomplete")
  end
end
