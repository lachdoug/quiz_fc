class SupportsController < ApplicationController

  def show
  end

  def create
    SupportMailer.email( params[:email], contact_params[:message] ).deliver_now
    redirect_to root_path, notice: "Successfully sent message."
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
