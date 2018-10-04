require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest

  test "show landing page" do
    get root_path
    assert_response :success
    assert_select "h4", "for 10 plays"
  end

end
