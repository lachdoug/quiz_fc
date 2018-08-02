# module AnswerForms
#   class SelectsController < ApplicationController
#
#     before_action :set_answer_form_select, only: [:edit, :update, :destroy]
#
#     def edit
#     end
#
#     def update
#       respond_to do |format|
#         if @answer_form_select.update(answer_form_select_params)
#           format.html { redirect_to @answer_form_select.question, notice: 'Answer form was successfully updated.' }
#           format.json { render :show, status: :ok, location: @answer_form_select }
#         else
#           format.html { render :edit }
#           format.json { render json: @answer_form_select.errors, status: :unprocessable_entity }
#         end
#       end
#     end
#
#     def destroy
#       @answer_form_select.question.update( answer_form_type: nil, answer_form_id: nil ) && @answer_form_select.destroy
#       respond_to do |format|
#         format.html { redirect_to question_url( @answer_form_select.question ), notice: 'Answer form was successfully deleted.' }
#         format.json { head :no_content }
#       end
#     end
#
#     private
#
#       def set_answer_form_select
#         @answer_form_select = AnswerForm::Select.find(params[:id])
#       end
#
#       def answer_form_select_params
#         params.require(:answer_form_select).permit(:tag_attributes_json, :options_json)
#       end
#
#   end
# end
