class GroceryStoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_name, :string
  attribute :location, :string

  # Direct associations

  has_many   :ingredients,
             foreign_key: :store_id

  # Indirect associations

  many_to_many :meals

  many_to_many :categories
end
