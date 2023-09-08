class DropFlipperTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :flipper_gates if table_exists?(:flipper_gates)
    drop_table :flipper_features if table_exists?(:flipper_features)
    drop_table :active_storage_variant_records if table_exists?(:active_storage_variant_records)
  end
end
