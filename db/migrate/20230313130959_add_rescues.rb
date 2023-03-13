class AddRescues < ActiveRecord::Migration[7.0]
  def change
    create_table :rescues do |t|
      t.string :name, default: nil
      t.string :breed, default: nil
      t.string :website_url, default: nil
      t.string :description, default: nil
    end
  end
end
