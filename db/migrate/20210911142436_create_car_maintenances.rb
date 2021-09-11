class CreateCarMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :car_maintenances do |t|
      t.decimal :value
      t.text :description
      t.date :date
      t.integer :warranty
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
