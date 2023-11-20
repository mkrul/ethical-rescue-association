class RemoveDonationIdFromApplicationSubmissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :application_submissions, :donation_id, :bigint
  end
end
