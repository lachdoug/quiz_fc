module Users
  class RegistrationsController < Devise::RegistrationsController

    protected

      def after_update_path_for(resource)
        user_management_path(resource)
      end

  end
end
