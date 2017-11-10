class AddIsInvoiceToCustomerOrders < ActiveRecord::Migration
  def change
    add_column :customer_orders, :is_invoice, :boolean, default: false
  end
end
