class AddCacheCategoryIdsToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :cache_category_ids, :text
  end
end
