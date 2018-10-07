module Quizzes
  class StopPlayingsController < ApplicationController

    def create
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.playing? && @quiz.draft!
      redirect_to @quiz
    end

  end
end
