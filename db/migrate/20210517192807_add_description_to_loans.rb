class AddDescriptionToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :description, :string
  end
end
