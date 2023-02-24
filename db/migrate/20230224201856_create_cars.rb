class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :photo
      t.text :description
      t.string :name
      t.integer :price
      t.integer :reservation_fee
      t.boolean :reserved, default: false

      t.timestamps
    end
  end
end
