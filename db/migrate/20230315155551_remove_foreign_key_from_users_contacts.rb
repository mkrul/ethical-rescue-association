class RemoveForeignKeyFromUsersContacts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :users_contacts, :users
    remove_foreign_key :users_contacts, :contacts
  end
end
