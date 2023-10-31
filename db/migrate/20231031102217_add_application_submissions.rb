class AddApplicationSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :application_submissions do |t|
      t.references :user, null: false
      t.references :donation, null: false
      t.string :organization, null: false
      t.string :specialization, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end
