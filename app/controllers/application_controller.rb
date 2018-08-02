class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # def current_admin_user
  #   current_user if current_user.try(:admin?)
  # end
  #
  # def authorize_admin!
  #   redirect_to(
  #     main_app.root_path,
  #     alert: "Not permitted."
  #   ) unless current_user.try(:admin?)
  # end

  layout :layout_by_resource

  # def current_developer
  #   current_admin if !current_admin.developer?
  # end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif self.class == IndexController
      "landing"
    else
      "application"
    end
  end


end
