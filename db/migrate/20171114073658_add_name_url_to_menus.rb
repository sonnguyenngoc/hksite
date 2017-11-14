class AddNameUrlToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :name_url, :string
  end
end
