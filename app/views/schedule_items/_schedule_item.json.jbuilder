json.extract! schedule_item, :id, :start_date, :end_date, :location, :user_id, :created_at, :updated_at
json.url schedule_item_url(schedule_item, format: :json)
