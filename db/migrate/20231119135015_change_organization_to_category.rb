class ChangeOrganizationToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :application_submissions, :organization, :category
  end
end
