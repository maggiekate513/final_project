class AddCategoryReferenceToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredients, :categories
    add_index :ingredients, :category_id
    change_column_null :ingredients, :category_id, false
  end
end
