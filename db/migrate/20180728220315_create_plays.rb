class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.integer :quiz_id
      t.integer :member_id
      t.integer :status, default: 0
      t.text :answers
      t.text :result

      t.timestamps
    end

    add_index :plays, :quiz_id
    add_index :plays, :member_id
    add_index :plays, :status
  end
end
