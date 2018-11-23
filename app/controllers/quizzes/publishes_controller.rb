# module Quizzes
#   class PublishesController < ApplicationController
#
#     def create
#       @quiz = Quiz.find( params[:quiz_id] )
#       @quiz.published!
#       redirect_to @quiz
#     end
#
#     def destroy
#       @quiz = Quiz.find( params[:quiz_id] )
#       @quiz.draft!
#       redirect_to @quiz
#     end
#
#   end
# end
