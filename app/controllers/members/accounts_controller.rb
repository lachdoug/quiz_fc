module Members
  class AccountsController < ApplicationController

    before_action :set_member, only: [:show]
    before_action :set_account, only: [:show]

    def show
    end

    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

    def set_account
      @account = @member.account
    end

  end

end
