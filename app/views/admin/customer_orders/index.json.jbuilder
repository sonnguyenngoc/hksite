json.array!(@customer_orders) do |customer_order|
  json.extract! customer_order, :id, :orderer_first_name, :orderer_last_name, :orderer_company_name, :orderer_email, :orderer_address_1, :orderer_address_2, :orderer_phone, :orderer_fax, :orderer_message
  json.url customer_order_url(customer_order, format: :json)
end
