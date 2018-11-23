class ProfilesController < ApplicationController

  def show
    @profile = Profile.for( current_user )
    redirect_to member_path( @profile.membership )
  end

end
