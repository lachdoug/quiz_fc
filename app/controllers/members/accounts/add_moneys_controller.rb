module Members
  module Accounts
    class AddMoneysController < ApplicationController

      before_action :set_member, only: [:new, :create]
      before_action :set_account, only: [:new, :create]

      def new
      end

      def create
        amount = params[:add_money][:amount].to_i
        succeeded_path = member_account_successful_checkout_path( member_id: @member.id )
        failed_path = member_account_failed_checkout_path( member_id: @member.id )
        @stripe_session = StripeSession.new(
          @account,
          amount,
          succeeded_path,
          failed_path
        )
        respond_to do |format|
          format.js { render :create }
        end
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
