class TransactorsController < ApplicationController

  layout 'admin'

  def new
    @league = League.find( params[:league_id] )
    @transactor = Transactor.new
  end

  def create
    @transactor = Transactor.new( transactor_params )
    respond_to do |format|
      if @transactor.process
        format.html { redirect_to comptroller_account_path( @transactor.member_account ), notice: 'Transactions were successful.' }
        format.json { render :show, status: :created, location: @transactor }
      else
        @league = League.find( params[:league_id] )
        debugger
        format.html { render :new }
        format.json { render json: @transactor.errors, status: :unprocessable_entity }
      end
    end
  end

  def transactor_params
    params.require(:transactor).permit(
      :code, :account_id, :amount, :comment
    )
  end


end
