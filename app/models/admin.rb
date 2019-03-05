class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :recoverable,
  # :registerable and :omniauthable
  # :ldap_authenticatable
  devise  :database_authenticatable, :timeoutable,
          :trackable, :lockable, :validatable

  def roles
    [].tap do |result|
      result << "Developer" if developer
      result << "Quizmaster" if quizmaster
      result << "Comptroller" if comptroller
      result << "Auditor" if auditor
    end
  end

end
