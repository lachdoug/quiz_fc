class Profile < ApplicationRecord

  def self.for( current_user )
    current_user.profile || create( user_id: current_user.id )
  end

  def next_quiz
    Quiz.next
  end

end
