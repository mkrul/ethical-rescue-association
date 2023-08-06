class DropUsersContacts < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_contacts
  end
end
