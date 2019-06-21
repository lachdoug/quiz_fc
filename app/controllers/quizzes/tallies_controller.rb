module Quizzes
  class TalliesController < ApplicationController

    layout 'admin'

    before_action :set_quiz, only: [ :new, :create ]

    def create
      if @quiz.perform_tally!
        redirect_to quizmaster_quiz_path( @quiz ),
          notice: "Successfully tallied quiz."
      else
        redirect_to quizmaster_quiz_path( @quiz ),
          alert: "Failed to tally quiz. To tally a quiz it must be in pending or results stage, and its quizbook must be finalised."
      end
    end

    private

      def set_quiz
        @quiz = Quiz.find(params[:quiz_id])
      end

  end
end
