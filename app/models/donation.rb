class Donation < ApplicationRecord
  belongs_to :user, optional: true

  monetize :amount_cents
  validates :amount_currency, presence: true
  validates :category, presence: true, inclusion: { in: %w(application_fee) }
  validates :payment_method, presence: true, inclusion: { in: %w(paypal) }
  validates :custom_var, inclusion: { in: %w(dog_rescue) }, allow_nil: true
  validates :txn, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: %w(completed) }
end
