class LandingsController < ApplicationController

  def show
    if current_user || Rails.env.development?
      redirect_to profile_path
    else
      redirect_to "https://www.quizfc.com"
    end
  end

end
