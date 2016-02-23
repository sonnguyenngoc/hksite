json.array!(@partners) do |partner|
  json.extract! partner, :id, :image_url, :name, :partner_id, :description
  json.url partner_url(partner, format: :json)
end
