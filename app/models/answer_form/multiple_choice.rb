# module AnswerForm
#   class MultipleChoice < ApplicationRecord
#
#     has_one :question, as: :answer_form, inverse_of: :answer_form
#
#     serialize :wrapper_attributes
#     serialize :options
#     validate :wrapper_attributes_json_updates_wrapper_attributes
#     validate :options_json_updates_options
#
#     def wrapper_attributes_json_updates_wrapper_attributes
#       begin
#         self.wrapper_attributes = JSON.parse( wrapper_attributes_json )
#       rescue JSON::ParserError
#         errors.add(:wrapper_attributes, "invalid JSON")
#       end
#     end
#
#     def options_json_updates_options
#       begin
#         self.options = JSON.parse( options_json )
#       rescue JSON::ParserError
#         errors.add(:options, "invalid JSON")
#       end
#     end
#
#     def wrapper_attributes_json
#       @wrapper_attributes_json ||= wrapper_attributes.present? ? wrapper_attributes.to_json : "{}"
#     end
#
#     def options_json
#       @options_json ||= options.present? ? options.to_json : "[]"
#     end
#
#     def update( params )
#       @wrapper_attributes_json = params[:wrapper_attributes_json]
#       @options_json = params[:options_json]
#       super params.except( :wrapper_attributes_json, :options_json )
#     end
#
#     def type
#       AnswerForm.types[ class_name ]
#     end
#
#     def class_name
#       self.class.name.to_s.to_sym
#     end
#
#   end
# end
