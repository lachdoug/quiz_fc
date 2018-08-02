class Quiz < ApplicationRecord
  enum status: [ :draft, :queued, :playing, :pending, :complete, :archived ]
  has_many :questions

  def to_s( type=nil )
    return "#{id} " + status.capitalize if type.to_s == "short"
    "#{id} " + status.capitalize + ( start.present? ? " " + start.strftime("%A %d %B %Y at %H:%M %Z") : "" )
  end

  # def self.recent
  #   where.not( status: 0 ).order( "start ASC" ).first(10)
  # end

  # def self.next
  #   pending.first || new
  # end

  # def start_date
  #   start_for_input.to_date
  # end
  #
  # def start_time
  #   start_for_input.to_time
  # end
  #
  # def start_for_input
  #   @start_for_input ||= start || Time.now
  # end

  def update( params )
    yr, mon, day = params[:start_date].split( "-" ).map &:to_i
    hr, min = params[:start_time].split( ":" ).map &:to_i
    start = DateTime.new(yr, mon, day, hr, min)
    super params.except( :start_date, :start_time ).merge( { start: start } )
  end



  def self.drafts
    where( status: 0 )
  end

  def self.queued
    where( status: 1 ).order( "start ASC" )
  end

  def self.playing
    where( status: 2 ).order( "start ASC" )
  end

  def self.pending
    where( status: 3 ).order( "start ASC" )
  end

  def self.complete
    where( status: 4 ).order( "start ASC" )
  end

  def self.archived
    where( status: 5 ).order( "start ASC" )
  end

end
