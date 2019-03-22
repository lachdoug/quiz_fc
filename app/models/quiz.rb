class Quiz < ApplicationRecord

  belongs_to :league
  belongs_to :quizbook
  has_many :plays
  has_many :questions, through: :quizbook

  enum status: [ :draft, :live, :archived ]


  before_validation( on: :create ) do
    assign_attributes( league.next_quiz_defaults )
  end

  validate :has_all_datetimes

  def to_s
    "Quiz #{ number }"
  end

  # def results; tally; end # DB col+index need renaming

  def stage
    @stage ||= if draft? || archived?
      nil
    elsif now < start
      :waiting
    elsif now < stop
      :current
    elsif now < results
      :pending
    elsif now < close
      :results
    else
      :closed
    end
  end

  def playable?
    stage == :current
  end

  def up?
    playable? || stage == :waiting
  end

  def completable?
    playable? || stage == :pending
  end

  def tallyable?
    quizbook.finalised? && ( stage == :pending || stage == :results )
  end

  def results?
    stage == :results
  end

  def pending?
    stage == :pending
  end

  def closed?
    stage == :closed
  end

  def now
    @now ||= Time.now.utc
  end

  def perform_tally!
    tallyable? && plays.each( &:calculate_score! ) && rank_plays!
  end

  def rank_plays!
    ranked_plays = scored_plays.sort_by do |play|
      play.result[:score]
    end.reverse
    total = ranked_plays.count
    last_rank = nil
    last_score = nil
    ranked_plays.each.with_index do |play, i|
      this_rank = i + 1
      this_score = play.result[:score]
      if this_score === last_score
        play.update_rank!( last_rank, total )
      else
        play.update_rank!( this_rank, total )
        last_rank = this_rank
        last_score = this_score
      end
    end
  end

  def self.next
    queued.first
  end

  def update( params )
    [ "start", "stop", "results", "close" ].each do |event|
      yr, mon, day = params["#{ event }_date"].split( "-" ).map &:to_i
      hr, min = params["#{ event }_time"].split( ":" ).map &:to_i
      datetime = DateTime.new(yr, mon, day, hr, min)
      params = params.except( "#{ event }_date", "#{ event }_time" ).merge( { event => datetime } )
    end
    super params
  end

  def destroy
    if plays.any?
      errors.add(:base, "Failed to delete. You can't delete quizzes that have been played.")
    elsif !draft?
      errors.add(:base, "Failed to delete. You can delete draft quizzes only.")
      return false
    else
      super
    end
  end

  def start_local
    start.in_time_zone league.timezone
  end

  def stop_local
    stop.in_time_zone league.timezone
  end

  def results_local
    results.in_time_zone league.timezone
  end

  def close_local
    close.in_time_zone league.timezone
  end

  def scored_plays
    plays.where status: :scored
  end

  # def fee
  #   super || 1
  # end
  #
  # def pool
  #   super || 50
  # end


  private

  def has_all_datetimes
    if status == "live" && ! ( start && stop && results && close )
      errors.add( :base, "Failed to luanch quiz. Please provide all dates." )
    end
  end

end
