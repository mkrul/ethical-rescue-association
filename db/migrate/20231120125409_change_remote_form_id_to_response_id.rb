class ChangeRemoteFormIdToResponseId < ActiveRecord::Migration[7.0]
  def change
    rename_column :application_submissions, :response_id, :response_id
  end
end
