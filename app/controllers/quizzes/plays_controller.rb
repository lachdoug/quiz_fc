module Quizzes
  class PlaysController < ApplicationController

    layout 'admin'

    before_action :set_quiz

    def index
    end

    private

      def set_quiz
        @quiz = Quiz.find(params[:quiz_id])
      end

  end
end
