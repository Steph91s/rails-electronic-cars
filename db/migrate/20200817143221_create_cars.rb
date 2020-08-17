class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :price_per_day
      t.string :location
      t.integer :number_of_seat
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
