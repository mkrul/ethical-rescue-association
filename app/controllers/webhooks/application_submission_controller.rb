
module Webhooks
  class ApplicationSubmissionController < ApplicationController

    def update
      outcome = ApplicationSubmissions::Update.run!(
        payload: payload
      )
      if outcome.valid?
        render json: { status: :ok }
      else
        render json: { status: :unprocessable_entity }
      end
    end

  end
end