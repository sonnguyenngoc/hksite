class AddBonusProductToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :bonus_product, :text
  end
end
