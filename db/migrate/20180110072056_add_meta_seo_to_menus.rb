class AddMetaSeoToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :meta_keywords, :string
    add_column :menus, :meta_description, :text
  end
end
