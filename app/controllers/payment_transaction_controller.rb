class PaymentTransactionController < ApplicationController
	include GlobalHelper
	skip_before_filter  :verify_authenticity_token
	def payment_transaction
		pt = PaymentTransaction.find(params[:payment_transaction_id])
		general_return_function("find", pt, "payment_transaction", pt)
	end

	def new
		pms = payment_transaction_params
		pt = PaymentTransaction.new(pms)
		req = User.find(pms[:requester_id])
		helper = User.find(pms[:helper_id])
		p = Payment.find(pms[:payment_method_id])
		pt.requester = req
		pt.helper = helper
		pt.payment_method = p
		general_return_function("save", pt, "payment_transaction")
	end

	def update
		pt = PaymentTransaction.find(params[:payment_transaction_id])
		#byebug
		p = Payment.find(payment_transaction_updatable_params[:payment_method_id])
		pt.payment_method = p
		general_return_function("update", pt.update_attributes(payment_transaction_updatable_params), "payment_transaction")
	end

	def payment_transaction_params
		params.require(:payment_transaction).permit(:requester_id, :helper_id, :payment_time, :amount, :payment_method_id)
	end

	def payment_transaction_updatable_params
		params.require(:payment_transaction).permit(:payment_time, :amount, :payment_method_id)
	end
end