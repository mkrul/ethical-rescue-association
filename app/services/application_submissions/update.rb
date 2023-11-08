require 'active_interaction'

module ApplicationSubmissions
  class Update < ActiveInteraction::Base
    string :email
    string :remote_form_id

    def execute
      update_application_submission
    end

    private

    def user
      User.find_by(email: email)
    end

    def application_submission
      ApplicationSubmission.where(
        user_id: user.id,
        status: "pending_submission"
      ).last
    end

    def update_application_submission
      application_submission.update!(
        status: "pending_review",
        submitted_at: Time.now,
        remote_form_id: remote_form_id
      )
    end
  end
end
