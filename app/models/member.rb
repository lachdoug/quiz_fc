class Member < ApplicationRecord

  belongs_to :profile
  belongs_to :league
  has_one :account, as: :accountable
  has_many :quizzes, through: :league
  has_many :plays

  def to_s
    profile
  end

  def live_quizzes
    quizzes.where( status: :live )
  end

  def live_plays
    plays.where( status: :playing ).joins( :quiz ).where( quizzes: { status: :live } )
  end

  def finished_plays
    plays.where.not( status: :playing ).joins( :quiz ).where( quizzes: { status: :live } )
  end

  def current_plays
    live_plays.select &:current?
  end

  def pending_plays
    finished_plays.select &:pending?
  end
  def results_plays
    finished_plays.select &:results?
  end

  def grouped_finished_plays
    finished_plays.group_by { |play| play.quiz.stage }
  end

  def grouped_live_quizzes
    live_quizzes.group_by { |quiz| quiz.stage }
  end

  def account
    super || create_account
  end

end
