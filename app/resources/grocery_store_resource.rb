class GroceryStoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_name, :string

  # Direct associations

  has_many   :ingredients,
             foreign_key: :store_id

  # Indirect associations

end
