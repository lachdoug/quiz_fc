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
    profile
    # "#{ profile } ( member# #{ id } )"
  end

  def live_quizzes
    quizzes.where( status: 1 )
  end

  # def live_unscored_plays
  #   # debugger
  #   unscored_plays.joins( :quiz ).where( quizzes: { status: :live } )
  # end
  #
  # def live_scored_plays
  #   # debugger
  #   scored_plays.joins( :quiz ).where( quizzes: { status: :live } )
  # end

  def currently_playing
    plays.where( status: :playing ).joins( :quiz ).where( quizzes: { status: :live } )
  end

  def finished_playing
    plays.where.not( status: :playing ).joins( :quiz ).where( quizzes: { status: :live } )
  end

  def finished_playing_groups
    finished_playing.group_by { |play| play.quiz.stage }
  end

  def live_quizzes_groups
    live_quizzes.group_by { |quiz| quiz.stage }
  end

  # def scored_plays
  #   plays.where( status: :scored ).joins( :quiz ).where( quizzes: { status: :live } )
  # end

  def account
    super || create_account
  end

end
