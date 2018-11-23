class QuestionsController < ApplicationController

  layout 'admin'

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @quizbook = Quizbook.find( params[:quizbook_id] )
    @question = @quizbook.questions.build template: @quizbook.questions.last ? @quizbook.questions.last.template : "default"
  end

  def create
    @quizbook = Quizbook.find( params[:quizbook_id] )
    @questions = @quizbook.questions
    new_question_params = question_params.merge ( { number: @questions.count + 1 } )
    @question = @questions.build( new_question_params )
    @question.save # validate: false
    # debugger
    respond_to do |format|
      format.html { redirect_to quizmaster_question_path( @question ), notice: 'Question was successfully created.' }
      format.json { render :show, status: :created, location: @question }
    end
  end

  def edit
  end

  def update
    # debugger
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to quizmaster_question_path( @question ), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        flash.now.alert = 'Failed to update question.'
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quizbook = @question.quizbook
    @number = @question.number
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quizmaster_quizbook_path( @quizbook ), notice: "Question #{ @number } was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:template, :config_yaml, config_params: {} )
    end

end
