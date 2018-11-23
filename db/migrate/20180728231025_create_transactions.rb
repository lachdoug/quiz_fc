class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :code, default: 0
      t.string :params
      t.string :comment
      t.timestamps
    end

    add_index :transactions, :account_id
  end
end
