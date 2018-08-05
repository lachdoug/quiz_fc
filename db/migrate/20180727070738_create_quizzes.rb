class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.datetime :start
      t.integer :duration_value
      t.integer :duration_units
      t.integer  :status, default: 0

      t.timestamps
    end
  end
end
