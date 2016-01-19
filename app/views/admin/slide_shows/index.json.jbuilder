json.array!(@slide_shows) do |slide_show|
  json.extract! slide_show, :id, :image_url, :description, :link_to
  json.url slide_show_url(slide_show, format: :json)
end
