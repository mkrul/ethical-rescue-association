class RemoveForeignKeyFromRescuesContacts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :rescues_contacts, :animal_rescues
    remove_foreign_key :rescues_contacts, :contacts
  end
end
