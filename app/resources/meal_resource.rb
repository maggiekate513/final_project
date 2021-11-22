class MealResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :chef, :integer
  attribute :description, :string

  # Direct associations

  has_many   :ingredients

  belongs_to :recipe_inventor,
             resource: UserResource,
             foreign_key: :chef

  # Indirect associations
end
