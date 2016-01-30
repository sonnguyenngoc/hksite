class CreateCustomerOrderDetails < ActiveRecord::Migration
  def change
    create_table :customer_order_details do |t|
      t.integer :customer_order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
