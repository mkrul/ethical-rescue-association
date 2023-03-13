class CreateRescuesContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :rescues_contacts do |t|
      t.references :rescue, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
