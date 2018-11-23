class Transaction < ApplicationRecord

  belongs_to :account

  serialize :params, Hash

  def detail
    comment.to_s + params_as_s
  end

  def params_as_s
    params.map { |k,v| " #{ k.to_s.humanize }: #{ v }" }.join
  end

end
