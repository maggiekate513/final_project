class IngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :meal_id, :integer
  attribute :name, :string
  attribute :category_id, :integer
  attribute :store_id, :integer
  attribute :cost, :float

  # Direct associations

  belongs_to :store,
             resource: GroceryStoreResource

  belongs_to :meal

  # Indirect associations

end
