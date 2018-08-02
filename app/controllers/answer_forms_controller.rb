# class AnswerFormsController < ApplicationController
#
#
#
#   # before_action :set_answer, only: [:edit, :update, :destroy]
#
#
#   # def show
#   #   @answer
#   # end
#
#   # # GET /answers/1/edit
#   # def edit
#   # end
#   #
#   #
#   # # PATCH/PUT /answers/1
#   # # PATCH/PUT /answers/1.json
#   # def update
#   #   respond_to do |format|
#   #     if @answer.update(answer_params)
#   #       format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
#   #       format.json { render :show, status: :ok, location: @answer }
#   #     else
#   #       format.html { render :edit }
#   #       format.json { render json: @answer.errors, status: :unprocessable_entity }
#   #     end
#   #   end
#   # end
#
#
#
#   # POST /build_answers
#   # POST /build_answers.json
#   def create
#     @question = Question.find( params[:question_id] )
#     # @answer =
#     # byebug
#     # @answer = Answer.const_get( answer_params[:type].capitalize ).create()
#     # @question.update( answer_type: answer_params[:type], answer_id: @answer.id )
#     #
#     respond_to do |format|
#       if @question.build_answer( answer_params[:type] )
#         format.html { redirect_to @question, notice: 'Answer form was successfully created.' }
#         format.json { render :show, status: :created, location: @question }
#       else
#         format.html { redirect_to @question, alert: 'Failed to create answer form.' }
#         format.json { render json: @question.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#
#   private
#
#     # def set_answer
#     #   @answer = Answer.find(params[:id])
#     # end
#
#     def answer_params
#       params.require(:answer_form).permit(:type)
#     end
#
# end
