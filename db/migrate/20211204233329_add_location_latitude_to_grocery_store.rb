class AddLocationLatitudeToGroceryStore < ActiveRecord::Migration[6.0]
  def change
    add_column :grocery_stores, :location_latitude, :float
  end
end
