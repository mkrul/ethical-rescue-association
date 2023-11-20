
module Webhooks
  class ApplicationSubmissionController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:update]

    def update
      outcome = ApplicationSubmissions::Update.run!(
        email: email,
        response_id: response_id
      )
      if outcome.valid?
        render json: { status: :ok }
      else
        render json: { status: :unprocessable_entity }
      end
    end

    private

    def application_submission_params
      params.permit(:email, :response_id)
    end

    def response_id
      application_submission_params[:response_id]
    end

    def email
      application_submission_params[:email]
    end

  end
end