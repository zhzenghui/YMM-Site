json.array!(@ablums) do |ablum|
  json.extract! ablum, :id, :title, :text, :publish, :free, :user_id, :url
  json.url ablum_url(ablum, format: :json)
end
