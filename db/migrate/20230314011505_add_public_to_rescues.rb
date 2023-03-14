class AddPublicToRescues < ActiveRecord::Migration[7.0]
  def change
    add_column :rescues, :visibility, :string, null: false, default: 'hidden'

    add_index :rescues, :visibility
  end
end
