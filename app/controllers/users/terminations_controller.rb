module Users
  class TerminationsController < ApplicationController


    def show
      session[:user_termination_code] = rand( 10 ** 4 ).to_s.rjust( 4,"0" )
      @user_termination = User::Termination.new(
        current_user,
        session[:user_termination_code] )
    end

    def create
      @user_termination = User::Termination.new(
        current_user,
        session[:user_termination_code] )
      respond_to do |format|
        if @user_termination.process( termination_params )
          format.html { redirect_to root_path, notice: 'Your account was successfully terminated.' }
          format.json { head :no_content }
        else
          format.html { render :show }
          format.json { render json: @user_termination.errors, status: :unprocessable_entity }
        end
      end
    end


    # # DELETE /quizzes/1
    # # DELETE /quizzes/1.json
    # def destroy
    #   @quiz.destroy
    #   respond_to do |format|
    #     format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end

    private

    def termination_params
      params.require(:user_termination).permit(:password_confirmation, :code_confirmation)
    end

  end
end
