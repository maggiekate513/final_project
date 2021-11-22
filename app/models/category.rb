class Category < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
