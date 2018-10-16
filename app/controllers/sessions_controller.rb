class SessionsController < ApplicationController

  def update
    session[:question_test_size] = params[:question_test_size]
  end

end
