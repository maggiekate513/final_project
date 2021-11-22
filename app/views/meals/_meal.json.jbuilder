json.extract! meal, :id, :chef, :description, :photo, :created_at, :updated_at
json.url meal_url(meal, format: :json)
