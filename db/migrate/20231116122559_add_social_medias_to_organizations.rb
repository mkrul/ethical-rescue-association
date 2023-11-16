class AddSocialMediasToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :website_url, :string, default: nil
    add_column :organizations, :facebook_url, :string, default: nil
    add_column :organizations, :instagram_url, :string, default: nil
    add_column :organizations, :tiktok_url, :string, default: nil
  end
end
