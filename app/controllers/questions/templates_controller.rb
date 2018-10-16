module Questions
  class TemplatesController < ApplicationController

    layout 'admin'

    def edit
      @question = Question.find params[:question_id]
    end

    def update
      @question = Question.find params[:question_id]
      @question.update( template: params[:question][:template] )
      redirect_to @question, notice: "Question is now using template `#{ @question.template.humanize }`."
    end

  end
end
