class Member < ApplicationRecord

  belongs_to :profile
  belongs_to :league
  has_one :account, as: :accountable
  has_many :quizzes, through: :league
  has_many :plays

  # has_many :live_quizzes, through: :league, source: :quizzes
  # scope :live_quizzes, -> { join(:quizzes).where( status: 1 ) }
  # has_many :played_quizzes, through: :plays
# has_many :played_quizzes, -> { Quiz.admin }, through: :memberships, source: :user

  def to_s
    "#{ profile } ( member# #{ id } )"
  end

  def live_quizzes
    quizzes.where( status: 1 )
  end

  def live_plays
    # debugger
    plays.joins( :quiz ).where( quizzes: { status: 1 } )
  end

  def account
    super || create_account
  end

end
