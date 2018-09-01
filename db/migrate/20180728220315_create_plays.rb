class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.integer :quiz_id
      t.integer :profile_id
      t.text :answers
      t.text :points
      t.integer :score

      t.timestamps
    end
  end
end
