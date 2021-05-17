class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.decimal :value
      t.date :date
      t.references :taker, null: true, foreign_key: { to_table: :users }
      t.references :provider, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
