module Plays
  class CompletesController < ApplicationController

    before_action :set_member, only: [:show, :new, :create ]
    before_action :set_play, only: [:show, :new, :create ]

    def new
    end

    def create
      @play.completion
      redirect_to member_play_complete_path( @member, @play )
    end

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
