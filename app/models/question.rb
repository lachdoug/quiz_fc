class Question < ApplicationRecord
  belongs_to :quiz

  validate :config_is_a_hash_or_nil

  enum form_type: [ :input_field, :select_menu, :multiple_choice ]
  serialize :config

  def to_s
    "Question #{ number } of #{ quiz.questions.count }"
  end

  def config_yaml
    @config_yaml ||= config.to_yaml.sub(/^---/,"").sub(/\.\.\.\n$/,"").strip
  end

  def update( params )
    @config_yaml = params[:config_yaml]
    super params.except( :config_yaml )
  end

  def score_for( answer_attempt )
    answer == answer_attempt ? points : 0
  end

  def points
    ( config || {} )["points"] || 1
  end

  def ask_html
    Markdown.new( ask.to_s ).to_html
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

  private

  def config_is_a_hash_or_nil
    self.config = YAML.load( "---\n" + config_yaml.strip + "\n..." )
    unless config.is_a?(Hash) || config.nil?
      errors.add(:config, "invalid - must be a hash")
    end
  end

end
