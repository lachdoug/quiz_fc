class Play < ApplicationRecord

  belongs_to :quiz
  belongs_to :profile

  has_many :questions, -> { order( :number ) }, through: :quiz

  serialize :answers, Array

  def calculate_score
    question_scores.sum.tap do |score|
      update score: score
    end
  end

  def question_scores
    questions.each.map { |question| score_for question }
  end

  def give_answer( number, answer )
    raise "Already answered" if answers[ number - 1 ]
    answers[ number - 1 ] = answer
    save
  end

  def answer_for( question )
    answers[ question.number - 1 ]
  end

  def score_for( question )
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

end
