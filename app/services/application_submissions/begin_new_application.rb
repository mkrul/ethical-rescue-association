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
      create_application_submission unless errors.any?
    end

    private

    def form_url
      @form_url ||= ApplicationSubmissions::DetermineFormUrl.run(
        category: payload[:org],
        specialization: payload[:spec],
        email: current_user.email
      ).result
    end

    def create_application_submission
      begin
        ApplicationSubmission.create(
          user_id: current_user.id,
          category: payload[:org],
          specialization: payload[:spec],
          status: 'pending_submission',
          form_url: form_url
        )
      rescue StandardError => e
        errors.add(:application_submission, "could not be processed")
        Utils::ReportError.run!(
          error: e.message,
          context: {
            controller: 'ApplicationSubmissionsController',
            action: 'create',
            service: 'ApplicationSubmissions::Create',
            payload: payload,
            user_id: current_user.id,
            backtrace: e.backtrace
          },
        )
      end
    end

    def amount_in_cents
      amount = payload.dig(:amt)

      return amount.to_money(currency).cents if amount.present?
    end

    def currency
      @currency ||= payload.dig(:cc)
    end

    def status_lowercase
      payload.dig(:st)&.downcase
    end

  end
end