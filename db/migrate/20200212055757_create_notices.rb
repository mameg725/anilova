class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|

      t.timestamps

      t.integer :visitor_id
      t.integer :visited_id
      t.integer :favo_id
      t.integer :poscom_id
      t.integer :news_id
      t.string :action
      t.boolean :checked
    end

    add_index :notices, :visitor_id
    add_index :notices, :visited_id
    add_index :notices, :favo_id
    add_index :notices, :poscom_id
    add_index :notices, :news_id
  end
end
