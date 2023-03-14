class AddNullFalseToRescues < ActiveRecord::Migration[7.0]
  def change
    change_column_null :rescues, :name, false
    change_column_null :rescues, :breed, false
    change_column_null :rescues, :website_url, false
    change_column_null :rescues, :description, false
  end
end
