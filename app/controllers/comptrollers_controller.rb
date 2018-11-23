class ComptrollersController < ApplicationController

  layout 'admin'

  def show
    @leagues = League.all
  end

end
