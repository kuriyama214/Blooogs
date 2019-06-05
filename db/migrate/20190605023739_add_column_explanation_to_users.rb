class AddColumnExplanationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :explanation, :string
  end
end
