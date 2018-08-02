module Questions
  class TestsController < ApplicationController

    def create
      @question = Question.find( params[:question_id] )
      redirect_to @question, notice: "You scored #{@question.answer == params[:question][:answer] ? @question.points : 0 }"
    end

  end
end
