class Member < ApplicationRecord

  belongs_to :profile
  belongs_to :league
  has_one :account, as: :accountable
  has_many :plays
  has_many :quizzes, through: :league

  def to_s
    "Member #{ league }/#{ id } (#{ profile })"
  end


  def account
    super || create_account
  end

end
