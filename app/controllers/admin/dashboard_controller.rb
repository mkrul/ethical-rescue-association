
class Admin::DashboardController < ApplicationController
  include Admin::DashboardHelper

  def index
    authorize :index?, policy_class: AdminDashboardPolicy

    @total_pending_applications = ApplicationSubmission.where(status: 'pending_review').count
    @total_users = User.count
    @total_organizations = Organization.count
    @total_approved = ApplicationSubmission.approved.count
    @total_declined = ApplicationSubmission.declined.count
    @active_error_occurrances = Utils::ActiveErrorOccurrances.run().result
  end

end