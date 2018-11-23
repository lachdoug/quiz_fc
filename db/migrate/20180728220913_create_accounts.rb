class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :accountable_id
      t.string :accountable_type
      t.decimal :balance, default: 0, :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
