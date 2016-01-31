require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get shoplistSummary" do
    get :shoplistSummary
    assert_response :success
  end

  test "should get checklist" do
    get :checklist
    assert_response :success
  end

  test "should get setOrderStatus" do
    get :setOrderStatus
    assert_response :success
  end

  test "should get pickShopList" do
    get :pickShopList
    assert_response :success
  end

  test "should get addReceipt" do
    get :addReceipt
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

end
