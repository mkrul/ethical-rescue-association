class AddDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.integer :amount, null: false
      t.string :category, null: false
      t.string :payment_method, null: false
      t.references :user, default: nil
      t.string :custom_var, default: nil
      t.string :transaction, null: false
      t.string :currency, null: false
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
