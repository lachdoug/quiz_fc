# module AnswerForms
#   class InputsController < ApplicationController
#
#     before_action :set_answer_form_input, only: [:edit, :update, :destroy]
#
#     def edit
#     end
#
#     def update
#       respond_to do |format|
#         if @answer_form_input.update(answer_form_input_params)
#           format.html { redirect_to @answer_form_input.question, notice: 'Answer form was successfully updated.' }
#           format.json { render :show, status: :ok, location: @answer_form_input }
#         else
#           format.html { render :edit }
#           format.json { render json: @answer_form_input.errors, status: :unprocessable_entity }
#         end
#       end
#     end
#
#     def destroy
#       @answer_form_input.question.update( answer_form_type: nil, answer_form_id: nil ) && @answer_form_input.destroy
#       respond_to do |format|
#         format.html { redirect_to question_url( @answer_form_input.question ), notice: 'Answer form was successfully deleted.' }
#         format.json { head :no_content }
#       end
#     end
#
#     private
#
#       def set_answer_form_input
#         @answer_form_input = AnswerForm::Input.find(params[:id])
#       end
#
#       def answer_form_input_params
#         params.require(:answer_form_input).permit(:tag_attributes_json)
#       end
#
#   end
# end
