json.extract! collection_item, :id, :user_id, :collection_id, :file, :created_at, :updated_at
json.url collection_item_url(collection_item, format: :json)
