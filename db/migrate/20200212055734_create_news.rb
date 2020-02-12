class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|

      t.timestamps

      t.integer :user_id
      t.string :title
      t.string :news_text
    end
  end
end
