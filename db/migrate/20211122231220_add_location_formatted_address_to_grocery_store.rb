class AddLocationFormattedAddressToGroceryStore < ActiveRecord::Migration[6.0]
  def change
    add_column :grocery_stores, :location_formatted_address, :string
  end
end
