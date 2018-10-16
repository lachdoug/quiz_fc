class Question < ApplicationRecord

  belongs_to :quiz
  has_many_attached :files

  validate :config_updated
  validate :scoring_updated

  enum template: {
    default: 0,
    auckland: 1
  }, _prefix: :templated_with

  serialize :config
  serialize :scoring

  attr_accessor :config_yaml, :config_params

  # def self.templates
  #   [
  #     [ "None", nil ],
  #     [ "Aukland", :aukland ],
  #   ]
  # end

  # def config
  #   super || {}
  # end

  def to_s
    "Question #{ number }&nbsp;of&nbsp;#{ quiz.questions.count }".html_safe
  end

  def config_as_yaml
    config.to_yaml.sub(/^---/,"").sub(/\.\.\.\n$/,"").strip
  end

  def score_for( answer_attempt )
    Scorer.new( self, answer_attempt ).process
  end

  def next_question
    quiz.questions.find_by number: ( number + 1 )
  end

  def previous_question
    quiz.questions.find_by number: ( number - 1 )
  end

  def move_up
    previous_question &&
    previous_question.update( number: number ) &&
    update( number: number - 1 )
  end

  def move_down
    next_question &&
    next_question.update( number: number ) &&
    update( number: number + 1 )
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

  private

  def config_updated
    if config_yaml
      config_from_yaml
    elsif config_params
      config_from_params
    end && config_is_a_hash_or_nil
  end

  def config_from_yaml
    self.config = YAML.load( "---\n" + self.config_yaml.strip + "\n..." )
  rescue Psych::SyntaxError => e
    errors.add(:config, "invalid - there is a syntax error (line #{ e.line - 1 })")
  end

  def config_from_params
    self.config = config_params.to_h
  end

  def scoring_updated
    self.scoring = Scoring.new( self ).process
  rescue RegexpError
    errors.add(:config, "invalid - failed to interpret scoring")
  end

  def config_is_a_hash_or_nil
    unless config.is_a?(Hash) || config.nil?
      errors.add(:config, "invalid - must be a hash")
    end
  end

end
