class ChangeAmountToAmountCents < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :amount
    add_monetize :donations, :amount_cents, null: false
  end
end
