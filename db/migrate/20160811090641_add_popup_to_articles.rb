class AddPopupToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :popup, :boolean, :default => "false"
  end
end
