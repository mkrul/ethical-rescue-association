class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, default: nil
      t.boolean :email_is_visible, default: false
      t.boolean :phone_is_visible, default: false
    end
  end
end
