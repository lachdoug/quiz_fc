class Profile < ApplicationRecord

  has_many :members
  has_many :leagues, through: :members
  has_many :quizzes

  belongs_to :user

  def to_s
    user && user.email || "No user"
  end

  def self.for( current_user )
    current_user.profile || create_profile( current_user )
  end

  def self.create_profile( current_user )
    create( user_id: current_user.id )
  end

  def membership
    members.first || members.create( league_id: 1 )
  end

  def played_quizzes
    quizzes.distinct.sort
  end

  def unplayed_quizzes
    ( Quiz.playing - played_quizzes ).sort
  end

  def next_quiz
    Quiz.first
  end

end
