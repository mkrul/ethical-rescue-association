class Donation < ApplicationRecord
  belongs_to :user, optional: true

  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :category, presence: true
  validates :payment_method, presence: true
  validates :custom_var, inclusion: { in: %w(dog_rescue) }, allow_nil: true
  validates :transaction, presence: true, uniqueness: true
  validates :currency, presence: true
  validates :status, presence: true
end
