class LeaguesController < ApplicationController

  layout 'admin'

  before_action :set_league, only: [:show, :edit, :update, :destroy]

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new( league_params )
    # debugger
    @league.build_account
    respond_to do |format|
      if @league.save
        format.html { redirect_to comptroller_league_path( @league ), notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    respond_to do |format|
      if @league.destroy
        format.html { redirect_to comptroller_path, notice: 'League was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to comptroller_league_path( @league ),
          alert: @league.errors.full_messages.join( '<br>'.html_safe ) }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_league
      @league = League.find(params[:id])
    end

    def league_params
      params.require(:league).permit(
        :name, :currency, :timezone, :account_id
      )
    end


end


# class LeaguezesController < ApplicationController
#
#   layout 'admin'
#
#
#   # def new
#   #   @league = League.new( leaguebook_id: params[:leaguebook_id] )
#   # end
#
#   def show
#   end
#
#   def edit
#   end
#
#
#   def update
#     respond_to do |format|
#       if @league.update(league_params)
#         format.html { redirect_to leaguemaster_league_path( @league ), notice: 'League was successfully updated.' }
#         format.json { render :show, status: :ok, location: @league }
#       else
#         format.html { render :edit }
#         format.json { render json: @league.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   def destroy
#     respond_to do |format|
#       if @league.destroy
#         format.html { redirect_to leaguemaster_league_path( @league ), notice: 'League was successfully destroyed.' }
#         format.json { head :no_content }
#       else
#         format.html { redirect_to leaguemaster_league_path( @league ),
#           alert: @league.errors.full_messages.join( '<br>'.html_safe ) }
#         format.json { render json: @league.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#
# end
