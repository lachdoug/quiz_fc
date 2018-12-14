class RenameQuizTallyToResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :quizzes, :tally, :results
  end
end
