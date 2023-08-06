class DropRescuesContacts < ActiveRecord::Migration[7.0]
  def change
    drop_table :rescues_contacts
  end
end
