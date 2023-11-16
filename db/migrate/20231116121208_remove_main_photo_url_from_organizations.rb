class RemoveMainPhotoUrlFromOrganizations < ActiveRecord::Migration[7.0]
  def change
    remove_column :organizations, :main_photo_url, :string
  end
end
