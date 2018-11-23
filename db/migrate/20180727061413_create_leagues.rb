class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :currency
      t.string :timezone
      t.timestamps
    end

  end
end
