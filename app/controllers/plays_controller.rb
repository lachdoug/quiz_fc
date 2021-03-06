class PlaysController < ApplicationController

  before_action :set_member, only: [:index, :show, :create]
  before_action :set_play, only: [:show]

  def index
    @plays = @member.plays
  end

  def show
    if @play.archived?
      redirect_to member_path( @member ), alert: "Quiz has been archived."
    elsif @play.closed?
      redirect_to member_play_closed_path( @member, @play )
    elsif @play.playing?
      redirect_to new_member_play_question_path( @member, @play )
    elsif @play.pending?
      redirect_to member_play_pending_path( @member, @play )
    elsif @play.scored?
      redirect_to member_play_result_path( @member, @play )
    elsif @play.complete?
      redirect_to member_play_completed_path( @member, @play )
    else
      redirect_to member_path( @member ), alert: "Play is not available."
    end
  end

  def create
    @quiz = @member.quizzes.find( params[:quiz_id] )
    if @quiz.current?
      @play = @member.plays.create(
                member_id: @member.id,
                quiz_id: params[:quiz_id] )
      respond_to do |format|
        format.html { redirect_to new_member_play_question_path( @member, @play ) }
        format.json { render :show, status: :created, location: @play }
      end
    else
      redirect_to member_path( @member ), alert: "Failed to start quiz. This quiz is not playable."
    end
  end

  private

  def set_member
    @member = Profile.for( current_user ).members.find( params[:member_id] )
  end

  def set_play
    @play = @member.plays.find( params[:id] )
  end

end
