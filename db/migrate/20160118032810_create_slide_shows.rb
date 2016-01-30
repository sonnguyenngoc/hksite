class CreateSlideShows < ActiveRecord::Migration
  def change
    create_table :slide_shows do |t|
      t.string :image_url
      t.text :description
      t.string :link_to

      t.timestamps null: false
    end
  end
end
