module Members
  module Accounts
    class SuccessfulCheckoutsController < ApplicationController

      before_action :set_member, only: [ :show ]
      before_action :set_account, only: [ :show ]

      def show
        redirect_to member_path( @member ), notice: "Payment successful."
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
end
