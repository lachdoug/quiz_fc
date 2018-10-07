module Quizzes
  class StartPlayingsController < ApplicationController

    def create
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.draft? && @quiz.playing!
      redirect_to @quiz
    end

  end
end
