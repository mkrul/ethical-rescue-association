require 'active_interaction'

module ApplicationSubmissions
  class Create < ActiveInteraction::Base
    object :user, class: User
    object :donation, class: Donation
    string :organization
    string :specialization
    string :status, default: "pending_submission"

    APPLICATION_FEE = "application_fee"
    DONATION = "donation"
    APPLICATION_TYPES = %w(dog_rescue cat_rescue dog_cat_rescue shelter)

    def execute
      create_application_submission
    end

    private

    def create_application_submission
      ApplicationSubmission.create(
        user_id: user.id,
        donation_id: donation.id,
        organization: organization,
        specialization: specialization,
        status: status
      )
    end
  end
end
