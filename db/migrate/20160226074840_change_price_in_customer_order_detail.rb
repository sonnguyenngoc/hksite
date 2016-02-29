class ChangePriceInCustomerOrderDetail < ActiveRecord::Migration
  def change
    change_column :customer_order_details, :price, :decimal
  end
end
