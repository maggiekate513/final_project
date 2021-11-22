class AddMealReferenceToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredients, :meals
    add_index :ingredients, :meal_id
  end
end
