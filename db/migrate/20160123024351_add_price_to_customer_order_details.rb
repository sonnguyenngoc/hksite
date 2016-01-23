class AddPriceToCustomerOrderDetails < ActiveRecord::Migration
  def change
    add_column :customer_order_details, :price, :decimal, :precision => 8, :scale => 2
  end
end
