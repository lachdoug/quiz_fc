module Admins
  class SessionsController < Devise::SessionsController

    protected

      # def after_sign_in_path_for(resource)
      #   stored_location_for(resource) || quizmaster_path()
      # end

  end
end
