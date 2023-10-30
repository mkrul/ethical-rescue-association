require 'active_interaction'

module Donations
  class Create < ActiveInteraction::Base
    string :txn
    string :status
    string :amount
    string :currency
    string :custom_var, default: "donation"
    integer :user_id, default: nil
    string :payment_method, default: "paypal"

    APPLICATION_FEE = "application_fee"
    DONATION = "donation"
    APPLICATION_TYPES = %w(dog_rescue cat_rescue dog_cat_rescue shelter)

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
        custom_var: custom_var,
        amount_currency: currency,
        user_id: user_id,
        payment_method: 'paypal'
      )
    end

    def category
      return APPLICATION_FEE if custom_var.in?(APPLICATION_TYPES)

      custom_var
    end

    def amount_in_cents
      amount.to_money(currency).cents
    end

    def status_lowercase
      status.downcase
    end
  end
end
