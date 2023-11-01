class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: true, default: nil
    add_column :users, :last_name,  :string, null: true, default: nil
  end
end
