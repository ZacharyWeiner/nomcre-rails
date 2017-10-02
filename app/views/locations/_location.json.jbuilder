json.extract! location, :id, :name, :parent_id, :location_type, :created_at, :updated_at
json.url location_url(location, format: :json)
