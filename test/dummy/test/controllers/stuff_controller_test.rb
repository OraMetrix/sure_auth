require 'test_helper'

class StuffControllerTest < ActionController::TestCase
  test "should get private" do
    get :private
    assert_response :redirect
  end

  test "should get public" do
    get :public
    assert_response :success
  end

end
