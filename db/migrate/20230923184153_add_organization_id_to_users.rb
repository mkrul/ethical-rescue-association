class AddOrganizationIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :organization, default: nil
  end
end
