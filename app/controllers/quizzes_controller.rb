class QuizzesController < ApplicationController

  layout 'admin'

  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quizmaster_quiz_path( @quiz ), notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @quiz.destroy
        format.html { redirect_to quizmaster_path, notice: 'Quiz was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to quizmaster_quiz_path( @quiz ),
          alert: @quiz.errors.full_messages.join( '<br>'.html_safe ) }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(
        :fee, :pool,
        :start_date, :start_time,
        :stop_date, :stop_time,
        :tally_date, :tally_time,
        :close_date, :close_time,
      )
    end

end
