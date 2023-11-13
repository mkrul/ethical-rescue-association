class AddOrganizationsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations_users, id: false do |t|
      t.references :organization, index: true
      t.references :user, index: true
    end
  end
end
