class DropAnimalRescues < ActiveRecord::Migration[7.0]
  def change
    drop_table :animal_rescues
  end
end
