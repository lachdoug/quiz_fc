class PlaysController < ApplicationController

  def index
    @quiz = Quiz.find( params[:quiz_id] )
    @plays = current_user.profile.plays.where( quiz_id: params[:quiz_id] ).reverse
  end

  def create
    @quiz = Quiz.find( params[:quiz_id] )
    @play = @quiz.plays.create( profile_id: current_user.profile.id )
    respond_to do |format|
      format.html { redirect_to new_play_question_path( play_id: @play.id ) }
      format.json { render :show, status: :created, location: @play }
    end
  end

end
