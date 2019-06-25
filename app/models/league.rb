class League < ApplicationRecord

  has_one :account, as: :accountable
  has_many :posts, as: :postable
  has_many :members
  has_many :quizzes, -> { order( Arel.sql('number') ) }

  validates :name, :presence => true
  validates :currency, :presence => true
  validates :timezone, :presence => true
  validates :account, :presence => true

  # def self.currencies
  #   [
  #     "AUD",
  #     "NZD",
  #     "GBP",
  #     "EUR",
  #     "USD"
  #   ]
  # end

  def to_s
    name
  end

  def live_quizzes
    quizzes.live
  end

  def published_posts
    posts.where status: :published
  end

  def next_quiz_defaults
    latest_quiz = quizzes.last
    if latest_quiz
      number = latest_quiz.number + 1
      start = latest_quiz.start + 1.week
      stop = latest_quiz.stop + 1.week
      results = latest_quiz.results + 1.week
      close = latest_quiz.close + 1.week
    else
      number = 1
      start = Time.now.noon + 1.week
      stop = start + 1.day
      results = stop + 1.day
      close = results + 1.week
    end
    {
      number: number,
      fee: 1,
      pool: 50,
      start: start,
      stop: stop,
      results: results,
      close: close,
    }
  end

  def destroy
    if members
      super
    else
      errors.add(:base, "Failed to delete. Can't delete leagues that have memebers.")
      return false
    end
  end

  def self.currencies
    {
      "Australian Dollar" => :AUD,
      "Euro" => :EUR,
      "New Zealand Dollar" => :NZD,
      "Great Britain Pound" => :GBP,
      "United States Dollar" => :USD,
    }
  end


  # def self.timezones
  #   {
  #     "Greenwich Mean Time GMT" => :GMT,
  #     "Universal Coordinated Time GMT" => :UTC,
  #     "European Central Time GMT+1:00" => :ECT,
  #     "Eastern European Time GMT+2:00" => :EET,
  #     "(Arabic) Egypt Standard Time GMT+2:00" => :ART,
  #     "Eastern African Time GMT+3:00" => :EAT,
  #     "Middle East Time GMT+3:30" => :MET,
  #     "Near East Time GMT+4:00" => :NET,
  #     "Pakistan Lahore Time GMT+5:00" => :PLT,
  #     "India Standard Time GMT+5:30" => :IST,
  #     "Bangladesh Standard Time GMT+6:00" => :BST,
  #     "Vietnam Standard Time GMT+7:00" => :VST,
  #     "China Taiwan Time GMT+8:00" => :CTT,
  #     "Japan Standard Time GMT+9:00" => :JST,
  #     "Australia Central Time GMT+9:30" => :ACT,
  #     "Australia Eastern Time GMT+10:00" => :AET,
  #     "Solomon Standard Time GMT+11:00" => :SST,
  #     "New Zealand Standard Time GMT+12:00" => :NST,
  #     "Midway Islands Time GMT-11:00" => :MIT,
  #     "Hawaii Standard Time GMT-10:00" => :HST,
  #     "Alaska Standard Time GMT-9:00" => :AST,
  #     "Pacific Standard Time GMT-8:00" => :PST,
  #     "Phoenix Standard Time GMT-7:00" => :PNT,
  #     "Mountain Standard Time GMT-7:00" => :MST,
  #     "Central Standard Time GMT-6:00" => :CST,
  #     "Eastern Standard Time GMT-5:00" => :EST,
  #     "Indiana Eastern Standard Time GMT-5:00" => :IET,
  #     "Puerto Rico and US Virgin Islands Time GMT-4:00" => :PRT,
  #     "Canada Newfoundland Time GMT-3:30" => :CNT,
  #     "Argentina Standard Time GMT-3:00" => :AGT,
  #     "Brazil Eastern Time GMT-3:00" => :BET,
  #     "Central African Time GMT-1:00" => :CAT,
  #   }
  # end

  # def self.timezone_offset
  #   {
  #     GMT: "GMT",
  #     UTC: "GMT",
  #     ECT: "GMT+1:00",
  #     EET: "GMT+2:00",
  #     ART: "GMT+2:00",
  #     EAT: "GMT+3:00",
  #     MET: "GMT+3:30",
  #     NET: "GMT+4:00",
  #     PLT: "GMT+5:00",
  #     IST: "GMT+5:30",
  #     BST: "GMT+6:00",
  #     VST: "GMT+7:00",
  #     CTT: "GMT+8:00",
  #     JST: "GMT+9:00",
  #     ACT: "GMT+9:30",
  #     AET: "GMT+10:00",
  #     SST: "GMT+11:00",
  #     NST: "GMT+12:00",
  #     MIT: "GMT-11:00",
  #     HST: "GMT-10:00",
  #     AST: "GMT-9:00",
  #     PST: "GMT-8:00",
  #     PNT: "GMT-7:00",
  #     MST: "GMT-7:00",
  #     CST: "GMT-6:00",
  #     EST: "GMT-5:00",
  #     IET: "GMT-5:00",
  #     PRT: "GMT-4:00",
  #     CNT: "GMT-3:30",
  #     AGT: "GMT-3:00",
  #     BET: "GMT-3:00",
  #     CAT: "GMT-1:00",
  #   }
  # end

end
