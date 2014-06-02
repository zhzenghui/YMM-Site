json.array!(@in_app_types) do |in_app_type|
  json.extract! in_app_type, :id, :display_name, :in_app_type, :description, :apple_id, :apple_bundle_id, :apple_type, :price
  json.url in_app_type_url(in_app_type, format: :json)
end
