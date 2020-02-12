class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.timestamps

      t.integer :user_id
      t.integer :post_id
      t.text :reaction
    end
  end
end
