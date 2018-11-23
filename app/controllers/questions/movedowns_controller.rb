module Questions
  class MovedownsController < ApplicationController

    def create
      @question = Question.find params[:question_id]
      @question.move_down
      redirect_to quizmaster_question_path( @question ), notice: "Question is now question #{@question.number}."
    end

  end
end
