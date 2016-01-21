class CreateParentMenus < ActiveRecord::Migration
  def change
    create_table :parent_menus do |t|
      t.integer :parent_id
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
