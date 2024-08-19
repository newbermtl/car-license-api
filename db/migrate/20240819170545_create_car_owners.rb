class CreateCarOwners < ActiveRecord::Migration[7.2]
  def change
    create_table :car_owners do |t|
      t.references :car, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
