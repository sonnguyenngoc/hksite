class AddShortDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :short_description, :text
    add_column :articles, :meta_keywords, :string
    add_column :articles, :meta_description, :string
  end
end
