require 'active_interaction'

module Donations
  class Create < ActiveInteraction::Base
    string :txn
    string :status
    string :amount
    string :category
    string :currency
    object :user, class: User
    string :payment_method, default: "paypal"

    def execute
      create_donation
    end

    private

    def create_donation
      Donation.create(
        txn: txn,
        status: status_lowercase,
        amount_cents: amount_in_cents,
        category: category,
        amount_currency: currency,
        user_id: user.id,
        payment_method: 'paypal'
      )
    end

    def amount_in_cents
      amount.to_money(currency).cents
    end

    def status_lowercase
      status.downcase
    end
  end
end
