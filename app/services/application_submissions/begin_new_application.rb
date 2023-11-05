require 'active_interaction'

module ApplicationSubmissions
  class BeginNewApplication < ActiveInteraction::Base
    record :current_user, class: User
    hash :payload do
      string :tx
      string :st
      string :amt
      string :cc
      string :cm
      string :item_number
      string :item_name
      string :org
      string :spec
    end

    def execute
      create_application_submission
    end

    private

    def donation
      @donation ||=
        begin
          Donations::Create.run!(
            txn: payload[:tx],
            status: payload[:st],
            amount: payload[:amt],
            category: 'application_fee',
            currency: payload[:cc],
            user: current_user,
            payment_method: 'paypal'
          )
        rescue StandardError => e
          Rails.logger.error(e)
          errors.add(:donation, "could not be processed")
        end
    end

    def form_url
      @form_url ||= ApplicationSubmissions::DetermineFormUrl.run(
        organization: payload[:org],
        specialization: payload[:spec],
        email: current_user.email
      ).result
    end

    def create_application_submission
      begin
        ApplicationSubmissions::Create.run!(
          user: current_user,
          donation: donation,
          organization: payload[:org],
          specialization: payload[:spec],
          status: 'pending_submission',
          form_url: form_url
        )
      rescue StandardError => e
        Rails.logger.error(e)
        errors.add(:application_submission, "could not be processed")
      end
    end

  end
end