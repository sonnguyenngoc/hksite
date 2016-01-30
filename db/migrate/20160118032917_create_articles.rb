class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :image_url
      t.string :title
      t.text :content
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
