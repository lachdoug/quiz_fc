class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :postable_id
      t.string :postable_type
      t.integer :status, default: 0
      t.string :title
      t.string :body
      t.timestamps
    end

    add_index :posts, :postable_id
    add_index :posts, :postable_type
    add_index :posts, :status

  end
end
