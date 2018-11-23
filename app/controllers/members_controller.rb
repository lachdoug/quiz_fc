class MembersController < ApplicationController

  before_action :set_member, only: [:show]

  def show
  end

  private

  def set_member
    @member = Profile.for( current_user ).members.find( params[:id] )
  end


end
