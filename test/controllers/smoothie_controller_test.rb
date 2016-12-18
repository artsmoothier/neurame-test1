require 'test_helper'

class SmoothieControllerTest < ActionController::TestCase
  test "should get mix" do
    get :mix
    assert_response :success
  end

end
