class AddFormUrlToApplicationSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :application_submissions, :form_url, :string
  end
end
