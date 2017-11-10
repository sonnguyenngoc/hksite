class AddMenuImageToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :menu_image, :string
  end
end
