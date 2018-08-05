module Questions
  class TestsController < ApplicationController

    def create
      @question = Question.find( params[:question_id] )
    end

  end
end
