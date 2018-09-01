module Questions
  class TestsController < ApplicationController

    def create
      @question = Question.find( params[:question_id] )
      @answer_attempt = ( params[:answer] || [] )
    end

  end
end
