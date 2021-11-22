class GroceryStore < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             foreign_key: "store_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    store_name
  end
end
