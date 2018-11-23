class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :league_id
      t.integer :quizbook_id
      t.integer :status, default: 0
      t.integer :number
      t.integer :fee
      t.integer :pool
      t.datetime :start
      t.datetime :stop
      t.datetime :tally
      t.datetime :close

      t.timestamps
    end

    add_index :quizzes, :league_id
    add_index :quizzes, :quizbook_id
    add_index :quizzes, :status
    add_index :quizzes, :number
    add_index :quizzes, :start
    add_index :quizzes, :stop
    add_index :quizzes, :tally
    add_index :quizzes, :close
  end
end
