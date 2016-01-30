class AddTitleToSlideShows < ActiveRecord::Migration
  def change
    add_column :slide_shows, :title, :string
  end
end
