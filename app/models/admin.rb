class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :recoverable, :lockable, :registerable and :omniauthable
  # :ldap_authenticatable
  devise :database_authenticatable, :timeoutable, :trackable, :validatable

  def roles
    [].tap do |result|
      result << "Developer" if developer
      result << "Quizmaster" if quizmaster
      result << "Controller" if controller
      result << "Auditor" if auditor
    end
  end

end
