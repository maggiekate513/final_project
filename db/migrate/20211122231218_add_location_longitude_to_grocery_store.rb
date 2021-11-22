class AddLocationLongitudeToGroceryStore < ActiveRecord::Migration[6.0]
  def change
    add_column :grocery_stores, :location_longitude, :float
  end
end
