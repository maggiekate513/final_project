json.extract! grocery_store, :id, :store_name, :location, :created_at,
              :updated_at
json.url grocery_store_url(grocery_store, format: :json)
