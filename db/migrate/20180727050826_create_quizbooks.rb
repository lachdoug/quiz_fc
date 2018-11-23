class CreateQuizbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :quizbooks do |t|
      t.integer  :status, default: 0
      t.timestamps
    end

    add_index :quizbooks, :status
  end
end
