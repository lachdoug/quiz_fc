class User < ApplicationRecord
  # Include default devise modules. , :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable

  has_one :profile

  def remember_me
    true
  end

end
