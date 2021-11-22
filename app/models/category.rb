class Category < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             dependent: :destroy

  # Indirect associations

  has_many   :stores,
             through: :ingredients,
             source: :store

  has_many   :meals,
             through: :ingredients,
             source: :meal

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
