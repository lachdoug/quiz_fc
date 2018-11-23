class Play < ApplicationRecord

  belongs_to :quiz
  belongs_to :member

  has_many :questions, -> { order( Arel.sql('number') ) }, through: :quiz

  serialize :answers, Array
  serialize :points, Array

  enum status: [ :playing, :complete, :scored, :archived ]

  def calculate_score
    question_points.tap do |points|
      points.sum.tap do |score|
        update points: points, score: score
      end
    end
  end

  def question_points
    questions.each.map { |question| calculate_score_for question }
  end

  def give_answer( number, answer )
    answers[ number - 1 ] = answer
    save
  end

  def answer_for( question )
    answers[ question.number - 1 ] || []
  end

  def points_for( question )
    points[ question.number - 1 ]
  end

  def calculate_score_for( question )
    question.score_for answers[ question.number - 1 ]
  end

  def next_unanswered_question_number
    answers.count + 1
  end
  #
  def next_unanswered_question
    find_question_by_number next_unanswered_question_number
  end

  def find_question_by_number( question_number )
    questions.find_by number: question_number
  end

  def last_question
    find_question_by_number( questions.count )
  end

  def completion
    playing? && transact && complete!
  end

  def transact
    Transactor.new( account_id: member.account_id, amount: -quiz.fee, params: { play_id: id } ).process
  end

end
