require 'test_helper'

class DatadumpsControllerTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup_admin

  test "sends file" do
    get datadump_path
    assert_response :success
    # byebug
    assert_equal response.get_header( "Content-Disposition" ), 'attachment; filename="quizfc_datadump.rb"'
  end

  test_reset

end
