class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :chef
      t.text :description

      t.timestamps
    end
  end
end
