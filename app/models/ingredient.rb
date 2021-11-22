class Ingredient < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :category

  belongs_to :store,
             class_name: "GroceryStore"

  belongs_to :meal,
             optional: true,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    meal.to_s
  end
end
