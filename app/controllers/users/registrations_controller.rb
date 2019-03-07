module Users
  class RegistrationsController < Devise::RegistrationsController

    protected

    def after_update_path_for(resource)
      user_management_path(resource)
    end

    def after_sign_up_path_for(resource)
      signed_up_path
    end

  end
end
