class ChangeOrganizationsUsersToOrganizationUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :organizations_users, :organization_users
  end
end
