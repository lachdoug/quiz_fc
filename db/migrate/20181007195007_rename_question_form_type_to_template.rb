class RenameQuestionFormTypeToTemplate < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :form_type, :template
  end
end
