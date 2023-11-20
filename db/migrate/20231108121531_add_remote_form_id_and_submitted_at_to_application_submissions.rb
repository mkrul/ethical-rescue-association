class AddRemoteFormIdAndSubmittedAtToApplicationSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :application_submissions, :response_id, :string, default: nil
    add_column :application_submissions, :submitted_at, :datetime, default: nil
  end
end
