class QuestionsController < ApplicationController

  layout 'admin'

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @quiz = Quiz.find( params[:quiz_id] )
    @questions = @quiz.questions
    @question = @questions.build( number: @questions.count + 1 )
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_to @quiz, alert: 'Failed to create question.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        flash.now.alert = 'Failed to update question.'
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz = @question.quiz
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_path( @quiz ), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:ask, :answer, :points, :explanation, :form_type, :config_yaml)
    end

end
