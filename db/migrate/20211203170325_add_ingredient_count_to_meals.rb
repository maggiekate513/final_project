class AddIngredientCountToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :ingredients_count, :integer
  end
end
