class User < ApplicationRecord
  # Include default devise modules. , :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable

  has_one :profile, dependent: :destroy

end
