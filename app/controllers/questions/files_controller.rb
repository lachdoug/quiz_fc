module Questions
  class FilesController < ApplicationController

    before_action :set_question

    def show
      @file = @question.files.find params[:id]
    end

    def new
    end

    def destroy
      @file = @question.files.find params[:id]
      @file.purge
      redirect_to @question
    end

    private

    def set_question
      @question = Question.find( params[:question_id] )
    end

  end
end
