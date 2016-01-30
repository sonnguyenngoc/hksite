class AddLevelToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :level, :integer
  end
end
