json.extract! calendar, :id, :title, :description, :start_date, :end_date, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
