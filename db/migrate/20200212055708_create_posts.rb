class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps

      t.integer :user_id
      t.string :post_image_id
      t.text :murmur
    end
  end
end
