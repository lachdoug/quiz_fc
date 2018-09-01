class Profile < ApplicationRecord

  has_many :plays
  has_many :quizzes, through: :plays

  def self.for( current_user )
    current_user.profile || create( user_id: current_user.id )
  end

  def played_quizzes
    quizzes.distinct.sort
  end

  def unplayed_quizzes
    ( Quiz.queued - played_quizzes ).sort
  end

  def next_quiz
    Quiz.first
  end

end
