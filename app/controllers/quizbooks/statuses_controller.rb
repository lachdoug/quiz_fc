module Quizbooks
  class StatusesController < ApplicationController

    def update
      @quizbook = Quizbook.find( params[:quizbook_id] )
      @quizbook.status = params[:status]
      if @quizbook.save
        redirect_to quizmaster_quizbook_path( @quizbook ),
          notice: "Quizbook status is now #{ @quizbook.status }."
      else
        redirect_to quizmaster_quizbook_path( @quizbook ),
        alert: @quizbook.errors.full_messages.join( '<br>'.html_safe )
      end
    end

  end
end
