class Question < ApplicationRecord

  belongs_to :quiz
  has_many_attached :files

  validate :config_updated_from_yaml
  validate :config_is_a_hash_or_nil
  validate :scoring_updated_from_config

  enum form_type: [
    :input_field,
    :buttons,
    :select_menu,
    :checkboxes,
    :radios,
    :two_inputs,
    :two_selects,
    :select_and_input,
    :custom ]

  serialize :config
  serialize :scoring

  attr_writer :config_yaml

  def to_s
    "Question #{ number } of #{ quiz.questions.count }"
  end

  def config_yaml
    @config_yaml ||= config.to_yaml.sub(/^---/,"").sub(/\.\.\.\n$/,"").strip
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
    previous_question.update( number: number ) && update( number: number - 1 )
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

  def config_updated_from_yaml
    self.config = YAML.load( "---\n" + self.config_yaml.strip + "\n..." )
  rescue Psych::SyntaxError => e
    errors.add(:config, "invalid - there is a syntax error (line #{ e.line - 1 })")
  end

  def scoring_updated_from_config
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
