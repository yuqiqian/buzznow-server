class PaymentTransaction < ActiveRecord::Base
  belongs_to :requester, :class_name => "User"
  belongs_to :helper, :class_name => "User"
  belongs_to :payment_method, :class_name =>"payment"
end
