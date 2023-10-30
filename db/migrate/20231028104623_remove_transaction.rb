class RemoveTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :transaction
    add_column :donations, :txn, :string, null: false
  end
end
