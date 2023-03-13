class CreateUsersContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :users_contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
