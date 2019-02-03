module Users
  class SupportsController < ApplicationController

    def new
    end

    def create
      SupportMailer.email( current_user, contact_params[:message] ).deliver_now
      redirect_to user_management_path, notice: "Successfully sent message."
    end

    private

    def contact_params
      params.require(:contact).permit(:message)
    end

  end
end
