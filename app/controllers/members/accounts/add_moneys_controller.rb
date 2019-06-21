module Members
  module Accounts
    class AddMoneysController < ApplicationController

      before_action :set_member, only: [:new, :create]
      before_action :set_account, only: [:new, :create]

      def new
      end

      def create
        redirect_to new_member_account_payment_path( @member, amount: params[:add_money][:amount] )
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
