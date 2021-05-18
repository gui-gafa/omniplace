class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.decimal :value
      t.string :frequency
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
