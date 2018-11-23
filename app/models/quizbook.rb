class Quizbook < ApplicationRecord

  enum status: [ :draft, :ready, :finalised, :archived ]
  has_many :questions, -> { order( Arel.sql 'number' ) }, dependent: :destroy
  has_many :quizzes

  def to_s
    "Quizbook #{id}"
  end

  # def published!
  #   errors.add :base, "Ooops"
  # end

  def self.published
    where( status: [ :ready, :finalised ] )
  end

  def published?
    ready? || finalised?
  end

  def editable?
    draft? || ready?
  end

end
