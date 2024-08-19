class CreateCars < ActiveRecord::Migration[7.2]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.string :license
      t.boolean :legal

      t.timestamps
    end
  end
end
