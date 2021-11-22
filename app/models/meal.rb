class Meal < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_inventor.to_s
  end

end
