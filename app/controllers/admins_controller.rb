class AdminsController < ApplicationController

  layout 'admin'

  def show
    if current_admin
      if current_admin.quizmaster?
        redirect_to quizmaster_path
      elsif current_admin.comptroller?
        redirect_to comptroller_path
      elsif current_admin.auditor?
        redirect_to auditor_path?
      else
        redirect_to root
      end
    else
      redirect_to root
    end
  end

end
