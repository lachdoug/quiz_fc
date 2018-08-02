module Users
  class RegistrationsController < Devise::RegistrationsController

    protected

      def after_update_path_for(resource)
        quizmaster_path
      end

  end
end
