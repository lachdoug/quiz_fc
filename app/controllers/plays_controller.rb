class PlaysController < ApplicationController

  # before_action :set_play, only: [:show, :edit, :update, :destroy]

  # GET /plays
  # GET /plays.json
  def index
    @quiz = Quiz.find( params[:quiz_id] )
    @plays = current_user.profile.plays.where( quiz_id: params[:quiz_id] ).reverse
  end

  # # GET /plays/1
  # # GET /plays/1.json
  # def show
  # end

  # # GET /plays/new
  # def new
  #   @play = Play.new
  # end

  # # GET /plays/1/edit
  # def edit
  # end

  # POST /plays
  # POST /plays.json
  def create
    @quiz = Quiz.find( params[:quiz_id] )
    @play = @quiz.plays.create( profile_id: current_user.profile.id )
    respond_to do |format|
      format.html { redirect_to new_play_question_path( play_id: @play.id ) }
      format.json { render :show, status: :created, location: @play }
    end
  end

  # # PATCH/PUT /plays/1
  # # PATCH/PUT /plays/1.json
  # def update
  #   respond_to do |format|
  #     if @play.update(play_params)
  #       format.html { redirect_to @play, notice: 'Play was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @play }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @play.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /plays/1
  # # DELETE /plays/1.json
  # def destroy
  #   @play.destroy
  #   respond_to do |format|
  #     format.html { redirect_to plays_url, notice: 'Play was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_play
    #   @play = Play.find(params[:id])
    # end
    #
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def play_params
    #   params.require(:play).permit( :start_date, :start_time )
    # end
end
