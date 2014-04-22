json.array!(@photos) do |photo|
  json.extract! photo, :id, :buyShow, :is_conver, :ablum_id, :status
  json.url photo_url(photo, format: :json)
end
