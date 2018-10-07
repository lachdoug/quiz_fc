module Questions
  class TestsController < ApplicationController

    def new
      @question = Question.find( params[:question_id] )
    end

    def create
      @question = Question.find( params[:question_id] )
      @answer_attempt = ( params[:answer] || [] )
    end

  end
end
