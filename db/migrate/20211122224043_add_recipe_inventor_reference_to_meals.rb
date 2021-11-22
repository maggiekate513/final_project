class AddRecipeInventorReferenceToMeals < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :meals, :users, column: :chef
    add_index :meals, :chef
    change_column_null :meals, :chef, false
  end
end
