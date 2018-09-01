class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :quiz_id, null: false
      t.integer :number
      t.text :ask
      t.text :answer
      t.integer :points, default: 1
      t.integer :form_type, default: 0
      t.text :config
      t.text :scoring
      t.text :explanation

      # t.references :ask, polymorphic: true, index: true
      # t.references :answer_form, polymorphic: true, index: true

      t.timestamps
    end

    add_index :questions, :quiz_id

  end
end
