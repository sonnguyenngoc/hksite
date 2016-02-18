class CreateJoinTableCategoryMenu < ActiveRecord::Migration
  def change
    create_join_table :categories, :menus do |t|
      # t.index [:category_id, :menu_id]
      # t.index [:menu_id, :category_id]
    end
  end
end
