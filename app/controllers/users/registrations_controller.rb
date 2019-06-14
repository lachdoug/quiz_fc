module Users
  class RegistrationsController < Devise::RegistrationsController

    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email_confirmation])
    end

    def after_update_path_for(resource)
      user_management_path(resource)
    end

    def after_inactive_sign_up_path_for(resource)
      user_signed_up_path
    end

  end
end
