class User < ApplicationRecord
  # Include default devise modules. , :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
         #, :omniauthable

  attr_accessor :email_confirmation

  has_one :profile

  validates :email, confirmation: true

  def remember_me
    true
  end

end
