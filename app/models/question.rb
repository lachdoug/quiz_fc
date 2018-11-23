class Question < ApplicationRecord

  belongs_to :quizbook
  has_many_attached :files

  validate :config_updated
  validate :output_updated

  def self.templates
    [ :default, :auckland ]
  end

  serialize :config
  serialize :scoring

  attr_accessor :config_yaml, :config_params

  def to_s
    "Question #{ number }&nbsp;of&nbsp;#{ quizbook.questions.count }".html_safe
  end

  def config_as_yaml
    config.to_yaml.sub(/^---/,"").sub(/\.\.\.\n$/,"").strip
  end

  def score_for( answer_attempt )
    Scorer.new( self, answer_attempt ).process
  end

  def next_question
    quizbook.questions.find_by number: ( number + 1 )
  end

  def previous_question
    quizbook.questions.find_by number: ( number - 1 )
  end

  def move_up
    previous_question &&
    previous_question.to( number ) &&
    to( number - 1 )
  end

  def move_down
    next_question &&
    next_question.to( number ) &&
    to( number + 1 )
  end

  def to( number )
    self.number = number
    save # validate: false
  end

  def destroy
    files.each &:purge
    super
  end

  def attach( uploaded_files )
    uploaded_files.each do |file|
      files.attach io: file, filename: 'file'
    end
  end

  def final_edit?
    !quizbook.draft?
  end

  private

  def config_updated
    # debugger
    if config_yaml
      config_from_yaml
    elsif config_params
      config_from_params
    end && config_is_a_hash_or_nil
  end

  def config_from_yaml
    self.config = YAML.load( "---\n" + self.config_yaml.strip + "\n..." )
  rescue Psych::SyntaxError => e
    errors.add :config, "invalid - there is a syntax error (line #{ e.line - 1 })"
  end

  def config_from_params
    self.config = config_params.to_h
  end

  def output_updated
    ask_updated &&
    answer_updated &&
    points_updated &&
    scoring_updated
  end

  def ask_updated
    # debugger
    ask = ( config || {} )["ask"]
    self.ask = ask
    # if ask
    # else
    #   errors.add :base, "Configuration error - config requires 'ask'"
    # end
  end

  def answer_updated
    answer = ( config || {} )["answer"]
    self.answer = answer
    # if answer
    # else
    #   errors.add :base, "Configuration error - config requires 'answer'"
    # end
  end

  def points_updated
    points = ( config || {} )["points"]
    points = 1 if points === ""
    self.points = points.to_i
  end

  def scoring_updated
    # debugger
    self.scoring = Scoring.new( self ).process
  rescue RegexpError
    errors.add :base, "Configuration error - failed to interpret scoring"
  end

  def config_is_a_hash_or_nil
    unless config.is_a?(Hash) || config.nil?
      errors.add :base, "Configuration error - config must be a hash"
    end
  end

end
