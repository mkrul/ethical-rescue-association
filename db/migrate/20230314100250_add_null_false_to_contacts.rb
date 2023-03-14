class AddNullFalseToContacts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contacts, :first_name, false
    change_column_null :contacts, :last_name, false
    change_column_null :contacts, :home_phone, false
    change_column_null :contacts, :cell_phone, false
    change_column_null :contacts, :email, false
  end
end
