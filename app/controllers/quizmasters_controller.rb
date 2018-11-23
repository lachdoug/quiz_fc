class QuizmastersController < ApplicationController

  layout 'admin'

  def show
    @leagues = League.all
    @quizbooks = Quizbook.all
    # debugger
  end

end
