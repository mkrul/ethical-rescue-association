class AddOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.text :description, default: nil
      t.string :level, null: false
      t.string :ein, default: nil
      t.string :main_photo_url, default: nil
      t.timestamps null: false
    end
  end
end
