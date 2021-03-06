class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string

  # Direct associations

  has_many :ingredients

  # Indirect associations

  many_to_many :stores,
               resource: GroceryStoreResource

  many_to_many :meals
end
