class Meal < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  belongs_to :recipe_inventor,
             :class_name => "User",
             :foreign_key => "chef"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_inventor.to_s
  end

end
