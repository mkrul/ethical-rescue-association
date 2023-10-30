class RemoveAmountCentsCents < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :amount_cents_cents
    remove_column :donations, :amount_cents_currency
  end
end
