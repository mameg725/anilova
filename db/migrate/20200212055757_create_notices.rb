class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|

      t.timestamps

      t.integer :visitor_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :post_comment_id
      t.integer :news_id
      t.string :action
      t.boolean :checked
    end

    add_index :notices, :visitor_id
    add_index :notices, :visited_id
    add_index :notices, :post_id
    add_index :notices, :post_comment_id
    add_index :notices, :news_id
  end
end
