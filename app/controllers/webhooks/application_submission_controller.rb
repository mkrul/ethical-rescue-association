
module Webhooks
  class ApplicationSubmissionController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:update]

    def update
      outcome = ApplicationSubmissions::Update.run!(
        email: email,
        remote_form_id: remote_form_id
      )
      if outcome.valid?
        render json: { status: :ok }
      else
        render json: { status: :unprocessable_entity }
      end
    end

    private

    def application_submission_params
      params.permit(:email, :remote_form_id)
    end

    def remote_form_id
      application_submission_params[:remote_form_id]
    end

    def email
      application_submission_params[:email]
    end

  end
end