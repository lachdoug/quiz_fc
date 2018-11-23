class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      # t.integer :account_id
      t.string :name
      t.string :currency
      t.string :timezone
      t.timestamps
    end

    add_index :leagues, :account_id
  end
end
