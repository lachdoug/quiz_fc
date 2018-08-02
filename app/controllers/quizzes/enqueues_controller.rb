module Quizzes
  class EnqueuesController < ApplicationController

    def create
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.draft? && @quiz.queued!
      # byebug
      # StartQuizJob.perform_now( params[:quiz_id] )
      redirect_to @quiz
    end

  end
end
