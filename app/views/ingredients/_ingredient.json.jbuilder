json.extract! ingredient, :id, :meal_id, :name, :category_id, :store_id, :cost, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
