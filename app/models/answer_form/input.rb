# module AnswerForm
#   class Input < ApplicationRecord
#
#     has_one :question, as: :answer_form, inverse_of: :answer_form
#
#     serialize :tag_attributes
#     validate :tag_attributes_json_updates_tag_attributes
#
#     def tag_attributes_json_updates_tag_attributes
#       begin
#         self.tag_attributes = JSON.parse( tag_attributes_json )
#       rescue JSON::ParserError
#         errors.add(:tag_attributes, "invalid JSON")
#       end
#     end
#
#     def tag_attributes_json
#       @tag_attributes_json ||= tag_attributes.present? ? JSON.pretty_generate( tag_attributes ) : "{}"
#     end
#
#     def update( params )
#       @tag_attributes_json = params[:tag_attributes_json]
#       super params.except( :tag_attributes_json )
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
