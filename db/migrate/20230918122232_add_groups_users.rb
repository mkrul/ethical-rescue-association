class AddGroupsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_users do |t|
      t.references :group, null: false, foreign_key: false
      t.references :user, null: false, foreign_key: false
      t.timestamps null: false
    end
  end
end
