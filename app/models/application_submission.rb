class ApplicationSubmission < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :donation_id, presence: true
  validates :organization, presence: true, inclusion: { in: %w(rescue shelter) }
  validates :specialization, presence: true, inclusion: { in: %w(dogs cats dogs_and_cats) }
  validates :status, presence: true, inclusion: { in: %w(pending_submission pending_review approved declined) }

  scope :approved, -> { where(status: 'approved') }
  scope :declined, -> { where(status: 'declined') }
end
