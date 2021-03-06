require "application_system_test_case"

class DatadumpsTest < ApplicationSystemTestCase

  include Warden::Test::Helpers

  setup_admin

  test "shows datadump" do
    visit quizmaster_path
    click_on 'Datadump'
    assert_selector "body", text: ""
  end

  test_reset
  #
  # include Warden::Test::Helpers
  #
  # setup_user(:one)
  #
  # test "shows home" do
  #   visit user_root_path
  #   assert_selector "h2", text: "Home"
  # end
  #

  # setup do
  #   @profile = profiles(:one)
  # end
  #
  # test "visiting the index" do
  #   visit profiles_url
  #   assert_selector "h1", text: "Profiles"
  # end
  #
  # test "creating a Profile" do
  #   visit profiles_url
  #   click_on "New Profile"
  #
  #   fill_in "User", with: @profile.user_id
  #   click_on "Create Profile"
  #
  #   assert_text "Profile was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a Profile" do
  #   visit profiles_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "User", with: @profile.user_id
  #   click_on "Update Profile"
  #
  #   assert_text "Profile was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "destroying a Profile" do
  #   visit profiles_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "Profile was successfully destroyed"
  # end
end
