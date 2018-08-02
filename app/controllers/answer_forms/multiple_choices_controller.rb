# module AnswerForms
#   class MultipleChoicesController < ApplicationController
#
#     before_action :set_answer_form_multiple_choice, only: [:edit, :update, :destroy]
#
#     def edit
#     end
#
#     def update
#       respond_to do |format|
#         if @answer_form_multiple_choice.update(answer_form_multiple_choice_params)
#           format.html { redirect_to @answer_form_multiple_choice.question, notice: 'Answer form was successfully updated.' }
#           format.json { render :show, status: :ok, location: @answer_form_multiple_choice }
#         else
#           format.html { render :edit }
#           format.json { render json: @answer_form_multiple_choice.errors, status: :unprocessable_entity }
#         end
#       end
#     end
#
#     def destroy
#       @answer_form_multiple_choice.question.update( answer_form_type: nil, answer_form_id: nil ) && @answer_form_multiple_choice.destroy
#       respond_to do |format|
#         format.html { redirect_to question_url( @answer_form_multiple_choice.question ), notice: 'Answer form was successfully deleted.' }
#         format.json { head :no_content }
#       end
#     end
#
#     private
#
#       def set_answer_form_multiple_choice
#         @answer_form_multiple_choice = AnswerForm::MultipleChoice.find(params[:id])
#       end
#
#       def answer_form_multiple_choice_params
#         params.require(:answer_form_multiple_choice).permit(:wrapper_attributes_json, :options_json)
#       end
#
#   end
# end
