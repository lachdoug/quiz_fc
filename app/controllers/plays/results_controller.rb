module Plays
  class ResultsController < ApplicationController

    before_action :set_member, only: [:show ]
    before_action :set_play, only: [:show ]

    def show
    end

    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

    def set_play
      @play = @member.plays.find( params[:play_id] )
    end

  end
end
