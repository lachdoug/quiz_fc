class QuestionsController < ApplicationController


  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # # GET /questions
  # # GET /questions.json
  # def index
  #   @questions = Question.all
  # end

  # GET /questions/1
  # GET /questions/1.json
  def show
    # byebug
    # @new_answer = @question.new_answer unless @question
    # @test_score = @question, notice: "You scored #{@question.answer == params[:test_answer] ? @question.points : 0 }"
  end

  # # GET /questions/new
  # def new
  #   @quiz = Quiz.find( params[:quiz_id] )
  #   @questions = @quiz.questions
  #   @question = @questions.create( number: @questions.count )
  #   redirect_to @question, notice: "Successfully created question."
  # end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
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

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @quiz = @question.quiz
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_path( @quiz ), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:ask, :answer, :form_type, :config_yaml)
    end
end
