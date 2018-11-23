class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :profile_id
      t.string :league_id
      # t.integer :account_id
      t.timestamps
    end

    add_index :members, :profile_id
    add_index :members, :league_id
    add_index :members, :account_id
  end
end
