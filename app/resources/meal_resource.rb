class MealResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :chef, :integer
  attribute :description, :string
  attribute :photo, :string
  attribute :meal_name, :string

  # Direct associations

  has_many   :ingredients

  belongs_to :recipe_inventor,
             resource: UserResource,
             foreign_key: :chef

  # Indirect associations

  many_to_many :stores,
               resource: GroceryStoreResource

  many_to_many :categories
end
