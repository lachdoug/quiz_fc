module Plays
  class CompletesController < ApplicationController

    def new
      @play = Play.find params[:play_id]
    end

    def create
      @play = Play.find params[:play_id]
      @play.played!
      redirect_to user_root_path( @play )
    end

  end
end
