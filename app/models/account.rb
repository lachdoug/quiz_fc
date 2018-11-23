class Account < ApplicationRecord

  belongs_to :accountable, polymorphic: true
  has_many :transactions

  def to_s
    "Account #{ id }"
  end

  def transact( amount, opts={} )
    transactions.create(
      amount: amount,
      comment: opts[:comment],
      params: opts[:params]
    ) && update( balance: balance + amount )
  end

end
