class ChangeParamsToBeTextInTransactions < ActiveRecord::Migration[5.2]
  def change
    change_column :transactions, :params, :text
  end
end
