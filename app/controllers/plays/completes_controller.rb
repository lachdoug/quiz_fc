module Plays
  class CompletesController < ApplicationController

    before_action :set_member, only: [ :show, :create ]
    before_action :set_play, only: [ :show, :create ]

    def show
    end

    def create
      if @play.completion
        redirect_to member_play_pending_path( @member, @play ), notice: "Quiz has been submitted for scoring."
      else
        redirect_to member_path( @member ), alert: "Failed to submit quiz for scoring."
      end
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
