
class Organization < ApplicationRecord
  has_many :organization_contacts
  has_many :contacts, through: :organization_contacts
  has_many :organization_users
  has_many :users, through: :organization_users
  has_many :organizations_tags
  has_many :tags, through: :organizations_tags

  has_one_attached :main_photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :specialization, presence: true, inclusion: { in: %w[dogs cats dogs_and_cats] }
  validates :category, inclusion: { in: %w[rescue shelter] }, presence: true
  validates :level, inclusion: { in: %w[bronze silver gold] }, presence: true
  validates :ein, presence: true, uniqueness: true, length: { is: 10 }, format: { with: /\A\d{2}-\d{7}\z/ }
  validates :website_url, presence: true, uniqueness: true
  validates :facebook_url, presence: true, uniqueness: true
  validates :instagram_url, presence: true, uniqueness: true
  validates :tiktok_url, presence: true, uniqueness: true

  scope :rescues, -> { where(category: 'rescue') }
  scope :shelters, -> { where(category: 'shelter') }
end
