class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :role, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
