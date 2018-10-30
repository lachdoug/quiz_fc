class AddStatusToPlays < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :status, :integer
  end
end
