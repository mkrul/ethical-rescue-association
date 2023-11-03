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
          ActiveRecord::Base.transaction do
            Donations::Create.run!(
              txn: payload[:tx],
              status: payload[:st],
              amount: payload[:amt],
              category: 'application_fee',
              currency: payload[:cc],
              user: current_user,
              payment_method: 'paypal'
            )
          end
        rescue StandardError
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
      ApplicationSubmissions::Create.run!(
        user_id: current_user.id,
        donation_id: @donation.id,
        organization: payload[:org],
        specialization: payload[:spec],
        status: 'pending_submission',
        form_url: form_url
      )
    end

  end
end