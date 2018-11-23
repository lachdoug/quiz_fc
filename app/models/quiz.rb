class Quiz < ApplicationRecord

  belongs_to :league
  belongs_to :quizbook
  has_many :plays
  has_many :questions, through: :quizbook

  enum status: [ :draft, :live, :archived ]

  before_validation( on: :create ) do
    self.number = league.next_quiz_number
  end

  validate :has_all_datetimes

  def to_s
    "Quiz #{ number }"
  end

  def stage
    if draft? || archived?
      nil
    elsif now < start
      :waiting
    elsif now < stop
      :current
    elsif now < tally
      :pending
    elsif now < close
      :results
    else
      :complete
    end
  end

  def now
    @now ||= Time.now.utc
  end

  def recalculate!
    plays.each &:calculate_score
  end

  def self.next
    queued.first
  end

  def update( params )
    [ "start", "stop", "tally", "close" ].each do |event|
      yr, mon, day = params["#{ event }_date"].split( "-" ).map &:to_i
      hr, min = params["#{ event }_time"].split( ":" ).map &:to_i
      datetime = DateTime.new(yr, mon, day, hr, min)
      params = params.except( "#{ event }_date", "#{ event }_time" ).merge( { event => datetime } )
    end
    super params
  end

  def destroy
    if draft?
      super
    else
      errors.add(:base, "Failed to delete. You can delete draft quizzes only.")
      return false
    end
  end

  def fee
    super || 1
  end

  def pool
    super || 50
  end


  private

  def has_all_datetimes
    if status == "live" && ! ( start && stop && tally && close )
      errors.add( :base, "Failed to luanch quiz. Please provide all dates." )
    end
  end

end
