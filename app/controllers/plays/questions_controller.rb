module Plays
  class QuestionsController < ApplicationController

    def new
      @play = Play.find params[:play_id]
      @question = @play.next_unanswered_question
      redirect_to play_question_path( @play, @question )
    end

    def show
      @play = Play.find params[:play_id]
      @question = @play.questions.find params[:id]
    end

    def update
      @play = Play.find params[:play_id]
      @question = @play.questions.find params[:id]
      @play.give_answer @question.number, params[:answer]
      @next_question = @question.next_question
      if @next_question
        redirect_to play_question_path( @play, @next_question )
      else
        redirect_to play_complete_path( @play )
      end
    end

  end
end
