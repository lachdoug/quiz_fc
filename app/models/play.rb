class Play < ApplicationRecord

  belongs_to :quiz
  belongs_to :member

  has_many :questions, -> { order( Arel.sql('number') ) }, through: :quiz

  serialize :answers, Array
  # serialize :points, Array
  serialize :result

  enum status: [ :playing, :complete, :scored ]

  def calculate_score!
    return if playing?
    question_points.tap do |points|
      points.sum.tap do |score|
        update result: { points: points, score: score }
      end
    end
    scored!
  end

  def update_rank!( rank, total )
    update result: {
      points: result[:points],
      score: result[:score],
      rank: rank,
      total_plays: total
    }
  end

  def question_points
    questions.each.map { |question| calculate_score_for question }
  end

  def give_answer( number, answer )
    quiz.current? && playing? && (
      answers[ number - 1 ] = answer
      save
    )
  end

  def answer_for( question )
    answers[ question.number - 1 ] || []
  end

  def points_for( question )
    result[:points][ question.number - 1 ]
  end

  def calculate_score_for( question )
    # debugger
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
    quiz.completable? && affordable? && playing? && transact && complete!
  end

  def transact
    Transactor.new(
      account_id: member.account.id,
      amount: -quiz.fee,
      comment: "#{quiz} fee",
      params: { play_id: id }
    ).process
  end

  def affordable?
    @affordable ||= member.account.balance >= quiz.fee
  end

  def archived?
    quiz.archived?
  end

  def closed?
    quiz.closed?
  end

  def current?
    quiz.current?
  end

  def pending?
    ( complete? || scored? ) && ( quiz.current? || quiz.pending? )
  end

  def results?
    scored? && quiz.results?
  end

end
