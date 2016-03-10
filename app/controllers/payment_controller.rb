class PaymentController < ApplicationController
  include GlobalHelper
  skip_before_filter  :verify_authenticity_token
  def payment
  	p = Payment.find(params[:payment_id])
  	general_return_function("find", p, "payment", p)
  end

  def new
  	p = Payment.new(payment_params)
  	u = User.find(payment_params[:user_id])
  	p.user = u
  	general_return_function("save", p.save, "payment")
  end

  def update
  	p = Payment.find(params[:payment_id])
    #byebug
  	general_return_function("update", p.update_attributes(payment_updatable_params), "payment")
  end

  def payment_params
  	params.require(:payment).permit(:user_id, :card_last_four_digit, :billing_address)
  end

  def payment_updatable_params
  	params.require(:payment).permit(:card_last_four_digit, :billing_address)
  end
end
