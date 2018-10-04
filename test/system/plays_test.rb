require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase

  include Warden::Test::Helpers

  setup_user
  setup_quiz
  setup_played_quiz

  test "user plays quiz and reviews" do
    visit user_root_path
    click_on "Quiz #{ @quiz.id }"
    click_on "Play"
    assert_selector "h2", text: "Question 1 of 2"
    find( :css, "input[name='answer[]']" ).set "test1"
    find( :css, "button[type='submit']" ).click
    assert_selector "h2", text: "Question 2 of 2"
    find( :css, "input[name='answer[]']" ).set "test2"
    find( :css, "button[type='submit']" ).click
    assert_selector "h2", text: "Quiz #{ @quiz.id } results"
    assert_selector "h3", text: "Your score: 2"
    click_on "Review"
    assert_selector "h2", text: "Question 1 of 2"
    click_on "Next"
    assert_selector "h2", text: "Question 2 of 2"
    find( :css, "a.btn i.fa-arrow-up" ).click
    assert_selector "h2", text: "Quiz #{ @quiz.id }"
    find( :css, "a.btn i.fa-arrow-up" ).click
    page.has_css?("#played_quizzes a", text: "Quiz #{ @quiz.id }")
  end

  test "user starts to play quiz then leaves and resumes" do
    visit user_root_path
    click_on "Quiz #{ @quiz.id }"
    click_on "Play"
    assert_selector "h2", text: "Question 1 of 2"
    find( :css, "input[name='answer[]']" ).set "test1"
    find( :css, "button[type='submit']" ).click
    assert_selector "h2", text: "Question 2 of 2"
    find( :css, "a.btn i.fa-arrow-up" ).click
    assert_selector "h2", text: "Quiz #{ @quiz.id }"
    click_on "Resume"
    assert_selector "h2", text: "Question 2 of 2"
    find( :css, "input[name='answer[]']" ).set "test2"
    find( :css, "button[type='submit']" ).click
    assert_selector "h2", text: "Quiz #{ @quiz.id } results"
  end

  test "user reviews played quiz" do
    visit user_root_path
    assert_selector "h2", text: "Home"
    byebug
    click_on "Quiz #{ @played_quiz.id }"
    assert_selector "h2", text: "Quiz #{ @played_quiz.id }"
    byebug
    # click_on "Play"
    # assert_selector "h2", text: "Question 1 of 2"
    # find( :css, "input[name='answer[]']" ).set "test1"
    # find( :css, "button[type='submit']" ).click
    # assert_selector "h2", text: "Question 2 of 2"
    # find( :css, "a.btn i.fa-arrow-up" ).click
    # assert_selector "h2", text: "Quiz #{ @quiz.id }"
    # click_on "Resume"
    # assert_selector "h2", text: "Question 2 of 2"
    # find( :css, "input[name='answer[]']" ).set "test2"
    # find( :css, "button[type='submit']" ).click
    # assert_selector "h2", text: "Quiz #{ @quiz.id } results"
  end


  test_reset

  #
  #
  # test "show landing page" do
  #   visit root_path
  #   assert_selector "h4", text: "for 10 plays"
  #
  #   ## Create a play
  #   post plays_path(), params: { quiz_id: @quiz.id }
  #   assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/new/, response.redirect_url
  #   play_id = /http:\/\/www.example.com\/plays\/(\d+)\/questions\/new/.match( response.redirect_url ).captures[0]
  #   ## Find the next unanswered question
  #   get new_play_question_path( play_id )
  #   assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/\d+/, response.redirect_url
  #   question_id = /http:\/\/www.example.com\/plays\/\d+\/questions\/(\d+)/.match( response.redirect_url ).captures[0]
  #   ## Get question 1 of 2
  #   get play_question_path( play_id: play_id, id: question_id )
  #   assert_select "h2", "Test1"
  #   ## Answer question 1 of 2
  #   patch play_question_path( play_id: play_id, id: question_id ), params: { answer: [ 'test1' ] }
  #   assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/\d+/, response.redirect_url
  #   question_id = /http:\/\/www.example.com\/plays\/\d+\/questions\/(\d+)/.match( response.redirect_url ).captures[0]
  #   ## Get question 2 of 2
  #   get play_question_path( play_id: play_id, id: question_id )
  #   assert_select "h2", "Test2"
  #   ## Answer question 2 of 2
  #   patch play_question_path( play_id: play_id, id: question_id ), params: { answer: [ 'test2' ] }
  #   assert_match /http:\/\/www.example.com\/plays\/\d+\/complete/, response.redirect_url
  #   ## Get quiz complete
  #   get play_complete_path( play_id: play_id )
  #   assert_match /http:\/\/www.example.com\/plays\/\d+\/result/, response.redirect_url
  #   ## Get quiz result
  #   get play_result_path( play_id: play_id )
  #   assert_select "h3", "Your score: 2"
  #   ## Show quiz question review
  #   get play_question_review_path( play_id: play_id, question_id: question_id )
  #   assert_select "h2", "Question 2 of 2"
  #   ## Show quiz as played
  #   get plays_path( quiz_id: @quiz.id )
  #   assert_select "td", "2"
  #
  #
  #
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
