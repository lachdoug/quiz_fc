module Plays
  class ReviewsController < ApplicationController

    def show
      @play = Play.find params[:play_id]
      @question = @play.questions.find params[:question_id]
    end

  end
end
