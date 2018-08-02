class HomesController < ApplicationController

  def show
    @profile = Profile.for( current_user )
  end

end
