json.array!(@manages) do |manage|
  json.extract! manage, :id
  json.url manage_url(manage, format: :json)
end
