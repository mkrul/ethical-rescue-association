class AddAmountCents < ActiveRecord::Migration[7.0]
  def change
    add_monetize :donations, :amount, null: false
  end
end
