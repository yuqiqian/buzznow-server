require 'test_helper'

class PaymentControllerTest < ActionController::TestCase
  test "should get sendPaymentRequest" do
    get :sendPaymentRequest
    assert_response :success
  end

  test "should get payToHelper" do
    get :payToHelper
    assert_response :success
  end

end
