module Plays
  class CompletesController < ApplicationController

    def show
      @play = Play.find params[:play_id]
      @play.calculate_score
      redirect_to play_result_path( @play )
    end

  end
end
