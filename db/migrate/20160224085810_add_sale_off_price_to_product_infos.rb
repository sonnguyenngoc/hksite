class AddSaleOffPriceToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :sale_off_price, :decimal
  end
end
