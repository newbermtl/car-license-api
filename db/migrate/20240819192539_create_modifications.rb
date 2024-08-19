class CreateModifications < ActiveRecord::Migration[7.2]
  def change
    create_table :modifications do |t|
      t.string :name
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
