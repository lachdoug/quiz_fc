# class ScheduleQuizzesJob < ApplicationJob
#   queue_as :default
#
#   def perform(*args)
#     byebug
#     Quiz.due_to_start.each &:launch
#   end
# end
