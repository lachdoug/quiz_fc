module Members
  class AccountsController < ApplicationController

    before_action :set_member, only: [:show]
    before_action :set_account, only: [:show]

    # def index
    #   @accounts = Account.all
    # end

    # def new
    #   @account = Account.new
    # end
    #
    # def create
    #   @account = Account.new( account_params )
    #   # debugger
    #   @account.build_account
    #   respond_to do |format|
    #     if @account.save
    #       format.html { redirect_to quizmaster_account_path( @account ), notice: 'Account was successfully created.' }
    #       format.json { render :show, status: :created, location: @account }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @account.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end
    #
    def show
    end
    #
    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

    def set_account
      @account = @member.account
    end

    #
    #   def account_params
    #     params.require(:account).permit(
    #       :name, :currency, :timezone, :account_id
    #     )
    #   end


  end


  # class AccountzesController < ApplicationController
  #
  #   layout 'admin'
  #
  #
  #   # def new
  #   #   @account = Account.new( accountbook_id: params[:accountbook_id] )
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
  #       if @account.update(account_params)
  #         format.html { redirect_to accountmaster_account_path( @account ), notice: 'Account was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @account }
  #       else
  #         format.html { render :edit }
  #         format.json { render json: @account.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  #
  #   def destroy
  #     respond_to do |format|
  #       if @account.destroy
  #         format.html { redirect_to accountmaster_account_path( @account ), notice: 'Account was successfully destroyed.' }
  #         format.json { head :no_content }
  #       else
  #         format.html { redirect_to accountmaster_account_path( @account ),
  #           alert: @account.errors.full_messages.join( '<br>'.html_safe ) }
  #         format.json { render json: @account.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  #
  #
  # end
end
