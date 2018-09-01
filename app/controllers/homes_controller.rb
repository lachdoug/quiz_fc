class HomesController < ApplicationController

  def show
    @profile = Profile.for( current_user )
    # @profile = current_user.profile
  end

end
