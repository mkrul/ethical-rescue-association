class AddSpecializationToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :specialization, :string
  end
end
