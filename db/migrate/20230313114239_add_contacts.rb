class AddContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name, default: nil
      t.string :last_name, default: nil
      t.string :home_phone, default: nil
      t.string :cell_phone, default: nil
      t.string :email, default: nil
    end
  end
end
