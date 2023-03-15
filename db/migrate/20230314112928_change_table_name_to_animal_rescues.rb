class ChangeTableNameToAnimalRescues < ActiveRecord::Migration[7.0]
  def change
    rename_table :rescues, :animal_rescues
  end
end
