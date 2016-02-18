class AddProductNewToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :product_new, :string
  end
end
