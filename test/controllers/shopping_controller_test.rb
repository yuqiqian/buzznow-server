require 'test_helper'

class ShoppingControllerTest < ActionController::TestCase
  test "should get supermarkets" do
    get :supermarkets
    assert_response :success
  end

  test "should get products" do
    get :products
    assert_response :success
  end

  test "should get productDetail" do
    get :productDetail
    assert_response :success
  end

end
