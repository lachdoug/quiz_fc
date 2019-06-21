module Members
  module Accounts
    class PaymentsController < ApplicationController

      before_action :set_member, only: [ :new, :create ]
      before_action :set_account, only: [ :new, :create ]

      def new
        @amount = params[:amount]
      end

      def create
        payment = @account.process_card_payment(
          stripeEmail: params[:stripeEmail],
          stripeToken: params[:stripeToken],
          amount: params[:amount]
        )
        if payment[:notice]
          redirect_to member_path( @member ), notice: payment[:notice]
        else
          redirect_to new_member_account_add_money_path( @member ), alert: payment[:alert]
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
