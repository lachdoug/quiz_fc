class QuizbooksController < ApplicationController

  layout 'admin'

  before_action :set_quizbook, only: [:show, :edit, :update, :destroy]

  def index
    @quizbooks = Quizbook.all
  end

  def new
    @quizbook = Quizbook.new
  end

  def show
  end

  def edit
  end

  def create
    @quizbook = Quizbook.create()
    respond_to do |format|
      format.html { redirect_to quizmaster_quizbook_path( @quizbook ), notice: 'Quizbook was successfully created.' }
      format.json { render :show, status: :created, location: @quizbook }
    end
  end

  def destroy
    @quizbook.destroy
    respond_to do |format|
      format.html { redirect_to quizmaster_path, notice: 'Quizbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_quizbook
      @quizbook = Quizbook.find(params[:id])
    end

    # def quiz_params
    #   params.require(:quizbook).permit( :status )
    # end

end
