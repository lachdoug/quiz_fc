module Members
  class ResultsController < ApplicationController

    before_action :set_member, only: [:show]

    def show
    end

    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

  end

end
