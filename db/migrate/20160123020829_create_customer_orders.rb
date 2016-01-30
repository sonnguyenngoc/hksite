class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.string :orderer_first_name
      t.string :orderer_last_name
      t.string :orderer_company_name
      t.string :orderer_email
      t.string :orderer_address_1
      t.string :orderer_address_2
      t.string :orderer_phone
      t.string :orderer_fax
      t.text :orderer_message

      t.timestamps null: false
    end
  end
end
