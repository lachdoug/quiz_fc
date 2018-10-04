require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup_user

  test "shows home" do
    get user_root_path
    assert_response :success
    assert_select "h2", "Home"
  end

  test_reset

end
