class UserController < ApplicationController
  include GlobalHelper
  skip_before_filter  :verify_authenticity_token

  def user
  	user = User.find(params[:user])
    if user
      res = success_return
      res["user"] = user
      render json:  res
    else
      render json:  fail_find
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      res = success_return
      res["user_id"] = user.id
      render json:  res
    else
      render json:  fail_save
    end
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params_updatable)
      render json:  success_return
    else
      render json:  fail_update
    end
  end

  def reset_password
    u = User.find_by email:params[:email]
    p = u.profile
    # Use some email sending method to reset password
    render json:  success_return
  end

  def profile
    u = User.find(params[:user_id])
    p = u.user_profile
    if p
      res = success_return
      res["profile"] = p
      render json:  res
    else
      render json: fail_find
    end
  end

  def create_profile
    p = UserProfile.new(user_profile_params)
    u = User.find(params[:user_id])
    u.profile = p
    if p.save
      render json: success_return
    else
      render json: fail_update
    end
  end

  def update_profile
    u = User.find(params[:user_id])
    p = u.profile
    if p.update_attributes(user_profile_updatable)
      render json: success_return
    else
      render json: fail_update
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
    print params
    params.require(:user).permit(:gt_id, :first_name, :last_name, :email)
  end

  def user_params_updatable
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def user_profile_params
    params.require(:profile).permit(:address, :password, :profile_img_url, :payment)
  end

  def user_profile_updatable
    params.require(:profile).permit(:address, :profile_img_url, :payment)
  end  

  def user
    user_id = params[:user]
    user = User.find(user_id)
    render json: user
  end
end
