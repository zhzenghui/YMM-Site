json.array!(@albums) do |album|
  json.extract! album, :id, :title, :text, :publish, :free, :user_id, :url
  json.url album_url(album, format: :json)
end
