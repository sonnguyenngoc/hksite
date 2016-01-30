class CreateProductInfos < ActiveRecord::Migration
  def change
    create_table :product_infos do |t|
      t.string :image_url
      t.text :description
      t.decimal :old_price
      t.string :product_hot
      t.string :product_sale
      t.string :product_bestselled
      t.string :product_prominent
      t.timestamps null: false
    end
  end
end