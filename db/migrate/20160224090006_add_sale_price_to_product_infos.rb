class AddSalePriceToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :sale_price, :decimal
  end
end
