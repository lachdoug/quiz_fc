require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup_quiz
  setup_user
  # @play_id = 0

  test "shows quiz on home page as unplayed" do
    get user_root_path
    assert_select "#unplayed_quizzes a", "Quiz #{ @quiz.id }"
  end

  test "shows plays index for quiz" do
    get plays_path( quiz_id: @quiz.id )
    assert_select "h2", "Quiz #{ @quiz.id }"
  end

  test "user plays quiz" do
    ## Create a play
    post plays_path(), params: { quiz_id: @quiz.id }
    assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/new/, response.redirect_url
    play_id = /http:\/\/www.example.com\/plays\/(\d+)\/questions\/new/.match( response.redirect_url ).captures[0]
    ## Find the next unanswered question
    get new_play_question_path( play_id )
    assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/\d+/, response.redirect_url
    question_id = /http:\/\/www.example.com\/plays\/\d+\/questions\/(\d+)/.match( response.redirect_url ).captures[0]
    ## Get question 1 of 2
    get play_question_path( play_id: play_id, id: question_id )
    assert_select "h2", "Test1"
    ## Answer question 1 of 2
    patch play_question_path( play_id: play_id, id: question_id ), params: { answer: [ 'test1' ] }
    assert_match /http:\/\/www.example.com\/plays\/\d+\/questions\/\d+/, response.redirect_url
    question_id = /http:\/\/www.example.com\/plays\/\d+\/questions\/(\d+)/.match( response.redirect_url ).captures[0]
    ## Get question 2 of 2
    get play_question_path( play_id: play_id, id: question_id )
    assert_select "h2", "Test2"
    ## Answer question 2 of 2
    patch play_question_path( play_id: play_id, id: question_id ), params: { answer: [ 'test2' ] }
    assert_match /http:\/\/www.example.com\/plays\/\d+\/complete/, response.redirect_url
    ## Get quiz complete
    get play_complete_path( play_id: play_id )
    assert_match /http:\/\/www.example.com\/plays\/\d+\/result/, response.redirect_url
    ## Get quiz result
    get play_result_path( play_id: play_id )
    assert_select "h3", "Your score: 2"
    ## Show quiz question review
    get play_question_review_path( play_id: play_id, question_id: question_id )
    assert_select "h2", "Question 2 of 2"
    ## Show quiz as played
    get plays_path( quiz_id: @quiz.id )
    assert_select "td", "2"
  end

  test_reset

end
