module Users
  class SignedUpsController < ApplicationController


    def show
      @email = params[:email]
    end

  end
end
