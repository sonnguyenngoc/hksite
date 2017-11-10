class AddImageUrlToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :image_url, :string
  end
end
