module Questions
  class MoveupsController < ApplicationController

    def show
      @question = Question.find params[:question_id]
      @question.move_up
      redirect_to @question, notice: "Question is now question #{@question.number}."
    end

  end
end
