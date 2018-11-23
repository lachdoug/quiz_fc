module Quizbooks
  class QuizzesController < ApplicationController

    def new
      @quiz = Quiz.new( quizbook_id: params[:quizbook_id] )
    end

    def create
      @quiz = Quiz.new( quiz_params )
      respond_to do |format|
        if @quiz.save
          format.html { redirect_to quizmaster_quiz_path( @quiz ), notice: 'Quiz was successfully created.' }
          format.json { render :show, status: :created, location: @quiz }
        else
          format.html { render :new }
          format.json { render json: @quiz.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def quiz_params
      params.require(:quiz).permit( :league_id, :quizbook_id )
    end

  end
end
