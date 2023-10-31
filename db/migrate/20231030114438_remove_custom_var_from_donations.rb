class RemoveCustomVarFromDonations < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :custom_var, :string
  end
end
