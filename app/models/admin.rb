class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :recoverable, :lockable, :registerable and :omniauthable
  devise :database_authenticatable, :timeoutable,
    :trackable, :validatable, :registerable

  enum role: [ :developer, :quizmaster, :controller, :auditor ]

end
