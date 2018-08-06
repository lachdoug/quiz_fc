module Quizzes
  class EnqueuesController < ApplicationController

    def create
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.draft? && @quiz.queued!
      redirect_to @quiz
    end

  end
end
