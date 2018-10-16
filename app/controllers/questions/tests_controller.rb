module Questions
  class TestsController < ApplicationController

    layout 'admin'

    def show
      @question = Question.find( params[:question_id] )
    end

    def new
      @question = Question.find( params[:question_id] )
      render layout: 'application'
    end

    def create
      @question = Question.find( params[:question_id] )
      @answer_attempt = ( params[:answer] || [] )
    end

  end
end
