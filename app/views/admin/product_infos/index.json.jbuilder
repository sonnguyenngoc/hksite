json.array!(@product_infos) do |product_info|
  json.extract! product_info, :id, :image_url, :description, :old_price, :product_hot, :product_sale, :product_bestselled, :product_prominent
  json.url product_info_url(product_info, format: :json)
end
