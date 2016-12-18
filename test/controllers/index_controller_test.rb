require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get indexin" do
    get :indexin
    assert_response :success
  end

end
