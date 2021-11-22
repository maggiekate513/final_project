class AddStoreReferenceToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredients, :grocery_stores, column: :store_id
    add_index :ingredients, :store_id
    change_column_null :ingredients, :store_id, false
  end
end
