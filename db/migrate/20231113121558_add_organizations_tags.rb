class AddOrganizationsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations_tags do |t|
      t.references :organization, null: false
      t.references :tag, null: false
      t.timestamps
    end
  end
end
