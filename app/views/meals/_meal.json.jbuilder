json.extract! meal, :id, :chef, :description, :photo, :meal_name, :created_at,
              :updated_at
json.url meal_url(meal, format: :json)
