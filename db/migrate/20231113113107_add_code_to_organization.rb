class AddCodeToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :code, :string
  end
end
