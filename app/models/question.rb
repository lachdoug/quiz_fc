class Question < ApplicationRecord
  belongs_to :quiz
  # belongs_to :answer_form, polymorphic: true, optional: true, inverse_of: :question

  validate :config_yaml_updates_config

  enum form_type: [ :input_field, :select_menu, :multiple_choice ]
  serialize :form_config

  def to_s
    "#{ sort_order } #{ ask && ask.split("\n")[0] }"
  end

  # def build_answer( form_type )
  #   answer = form_type.constantize.create()
  #   update( form_type: form_type, answer_form_id: answer.id ).tap do |is_updated|
  #     answer.destroy unless is_updated
  #   end
  # end

  def config_yaml_updates_config
    self.form_config = YAML.load( "---\n" + form_config_yaml.gsub(/^\n/, "").gsub(/\n$/, "") + "\n..." )
  end

  def form_config_yaml
    # byebug
    @form_config_yaml ||= form_config.to_yaml.sub(/^---/,"").sub(/^\n/,"").sub(/\.\.\.$/,"")
  end

  def update( params )
    # byebug
    @form_config_yaml = params[:form_config_yaml]
    super params.except( :form_config_yaml )
  end


end
