module Plays
  class ReviewsController < ApplicationController

    before_action :set_member, only: [:show ]
    before_action :set_play, only: [:show ]

    def show
      @question = @play.questions.find params[:question_id]
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
