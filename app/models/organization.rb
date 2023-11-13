
class Organization < ApplicationRecord
  has_many :organization_contacts
  has_many :contacts, through: :organization_contacts
  has_many :organization_users
  has_many :users, through: :organization_users
  has_many :organizations_tags
  has_many :tags, through: :organizations_tags

  has_one_attached :main_photo

  scope :rescues, -> { where(category: 'rescue') }
end
