class AddIndexesToAccounts < ActiveRecord::Migration[5.2]
  def change

        add_index :accounts, :accountable_id
        add_index :accounts, :accountable_type
        
  end
end
