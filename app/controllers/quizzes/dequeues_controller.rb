module Quizzes
  class DequeuesController < ApplicationController

    def create
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.queued? && @quiz.draft!
      redirect_to @quiz
    end

  end
end
