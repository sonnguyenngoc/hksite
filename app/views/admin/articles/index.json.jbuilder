json.array!(@articles) do |article|
  json.extract! article, :id, :image_url, :title, :content, :tag_id
  json.url article_url(article, format: :json)
end
