class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.datetime :start
      t.integer :duration
      t.integer  :status, default: 0

      t.timestamps
    end
  end
end
