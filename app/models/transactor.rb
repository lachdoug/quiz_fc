class Transactor < ApplicationForm

  attr_accessor :account_id, :amount, :params, :comment

  def process
    member_transaction && house_transaction
  end

  def member_account
    @member_account ||= Account.find( @account_id )
  end

  def house_account
    @house_account ||= @member_account.accountable.league.account
  end

  def member_transaction
    member_account.transact!( amount.to_f, params: @params, comment: @comment )
  end

  def house_transaction
    house_account.transact!( -amount.to_f, params: @params, comment: @comment )
  end

end
