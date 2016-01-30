json.array!(@menus) do |menu|
  json.extract! menu, :id, :title, :description
  json.url menu_url(menu, format: :json)
end
