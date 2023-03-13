class AddTimestampsToContacts < ActiveRecord::Migration[7.0]
  def change
    add_timestamps(:contacts)
  end
end
