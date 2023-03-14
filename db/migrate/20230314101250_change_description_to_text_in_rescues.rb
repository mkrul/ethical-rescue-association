class ChangeDescriptionToTextInRescues < ActiveRecord::Migration[7.0]
  def change
    change_column :rescues, :description, :text
  end
end
