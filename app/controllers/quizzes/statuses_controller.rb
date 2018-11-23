module Quizzes
  class StatusesController < ApplicationController

    def update
      @quiz = Quiz.find( params[:quiz_id] )
      @quiz.status = params[:status]
      if @quiz.save
        redirect_to quizmaster_quiz_path( @quiz ),
          notice: "Quiz status is now #{ @quiz.status }."
      else
        redirect_to quizmaster_quiz_path( @quiz ),
          alert: @quiz.errors.full_messages.join( '<br>'.html_safe )
      end
    end

  end
end
