module Plays
  class QuestionsController < ApplicationController

    before_action :set_member, only: [:new, :show, :update ]
    before_action :set_play, only: [:new, :show, :update ]

    def new
      @next_question = @play.next_unanswered_question
      if @next_question
        redirect_to member_play_question_path( @member, @play, @next_question )
      else
        redirect_to new_member_play_complete_path( @member, @play )
      end
    end

    def show
      @question = @play.questions.find params[:id]
    end

    def update
      if @play.quiz.playable?
        @question = @play.questions.find params[:id]
        @play.give_answer @question.number, ( params[:answer] || [] )
        @next_question = @question.next_question
        if @next_question
          redirect_to member_play_question_path( @member, @play, @next_question )
        else
          redirect_to new_member_play_complete_path( @member, @play )
        end
      else
        redirect_to new_member_play_complete_path( @member, @play ), alert: "Out of time. No longer accpeting answers for this quiz."
      end
    end

    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

    def set_play
      @play = @member.plays.find( params[:play_id] )
    end

  end
end
