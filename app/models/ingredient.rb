class Ingredient < ApplicationRecord
  # Direct associations

  belongs_to :meal,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    meal.to_s
  end

end
