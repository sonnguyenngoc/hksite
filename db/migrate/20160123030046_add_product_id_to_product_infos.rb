class AddProductIdToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :product_id, :integer
  end
end
