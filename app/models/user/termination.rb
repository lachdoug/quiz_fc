class User
  class Termination < ApplicationForm

    def initialize( current_user, code )
      @current_user = current_user
      @code = code
    end

    attr_accessor :password_confirmation, :code_confirmation

    validate :password_confirmation_match
    validate :code_confirmation_match

    def process( params )
      assign_attributes( params ) && valid? && @current_user.destroy
    end

    def password_confirmation_match
      unless @current_user.valid_password? password_confirmation
        errors.add :password_confirmation, "is invalid"
      end
    end

    def code_confirmation_match
      unless @code == code_confirmation
        errors.add :code_confirmation, "does not match"
      end
    end

  end
end
