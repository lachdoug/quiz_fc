class LandingsController < ApplicationController

  def show
    if current_user
      redirect_to user_root_path
    else
      redirect_to "https://www.quizfc.com"
    end
  end

end
