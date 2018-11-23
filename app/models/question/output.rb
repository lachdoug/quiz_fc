# class Question
#   class Output
#
#     def initialize( question )
#       @question = question
#       @errors = []
#     end
#
#     def process
#       {
#         scoring: scoring,
#
#       }
#     end
#
#     def scoring
#       Scoring.new( @question ).process
#       rescue RegexpError
#         @errors.push [ :config, "invalid - failed to interpret scoring" ]
#     end
#
#
#     private
#
#     def configs
#       ( @question.config || {} )['scoring']
#     end
#
#
#   end
# end
