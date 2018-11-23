class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :quizbook_id, null: false
      t.integer :number
      t.string :template
      t.text :config
      t.text :ask
      t.string :answer
      t.text :explanation
      t.integer :points
      t.text :scoring
      t.timestamps
    end

    add_index :questions, :quizbook_id
    add_index :questions, :number
  end
end
