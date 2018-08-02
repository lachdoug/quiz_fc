# module AnswerForm
#   class Select < ApplicationRecord
#
#     has_one :question, as: :answer_form, inverse_of: :answer_form
#
#     serialize :tag_attributes
#     serialize :options
#     validate :tag_attributes_json_updates_tag_attributes
#     validate :options_json_updates_options
#
#     def tag_attributes_json_updates_tag_attributes
#       begin
#         self.tag_attributes = JSON.parse( tag_attributes_json )
#       rescue JSON::ParserError
#         errors.add(:tag_attributes, "invalid JSON")
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
#     def tag_attributes_json
#       @tag_attributes_json ||= tag_attributes.present? ? tag_attributes.to_json : "{}"
#     end
#
#     def options_json
#       @options_json ||= options.present? ? options.to_json : "[]"
#     end
#
#     def update( params )
#       @tag_attributes_json = params[:tag_attributes_json]
#       @options_json = params[:options_json]
#       super params.except( :tag_attributes_json, :options_json )
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
