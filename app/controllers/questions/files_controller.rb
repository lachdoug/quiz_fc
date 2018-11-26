module Questions
  class FilesController < ApplicationController

    before_action :set_question

    layout 'admin'

    def show
      @file = @question.files.find params[:id]
    end

    def new
    end

    def create
      respond_to do |format|
        if @question.attach( uploaded_files )
          format.html { redirect_to quizmaster_question_path( @question ), notice: 'File was successfully attached.' }
          format.json { render :show, status: :ok, location: @question }
        else
          flash.now.alert = 'Failed to attach file.'
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @file = @question.files.find params[:id]
      @file.purge
      redirect_to quizmaster_question_path( @question )
    end

    private

    def set_question
      @question = Question.find( params[:question_id] )
    end

    def uploaded_files
      params.require(:files).map &:tempfile
    end

  end
end
