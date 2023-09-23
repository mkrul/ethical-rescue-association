class AddOrganizationContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_contacts do |t|
      t.references :organization, null: false
      t.references :contact, null: false
      t.timestamps
    end
  end
end
