class UserController < ApplicationController
  def info
  	gtId = params[:gtid]
  	@user = User.where(gt_id: gtId)[0]
  	@profile = @user.user_profile
  end

  def update
    @user = User.find(params[:user])
    if @user.update_attributes(user_params)
      return "OK"
    else
      return "Not successful"
    end
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

  def user
    user_id = params[:user]
    user = User.find(user_id)
    render json: user
  end
end
