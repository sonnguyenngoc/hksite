class AddTaxToCustomerOrders < ActiveRecord::Migration
  def change
    add_column :customer_orders, :orderer_tax, :string
  end
end
