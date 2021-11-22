class Meal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :ingredients,
             dependent: :destroy

  belongs_to :recipe_inventor,
             class_name: "User",
             foreign_key: "chef"

  # Indirect associations

  has_many   :stores,
             through: :ingredients,
             source: :store

  has_many   :categories,
             through: :ingredients,
             source: :category

  # Validations

  # Scopes

  def to_s
    recipe_inventor.to_s
  end
end
