class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.integer :meal_id
      t.string :name
      t.integer :category_id
      t.integer :store_id
      t.float :cost

      t.timestamps
    end
  end
end
