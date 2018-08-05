module Plays
  class ResultsController < ApplicationController

    def show
      @play = Play.find params[:play_id]
    end

  end
end
