
class Organization < ApplicationRecord
  has_many :organization_contacts
  has_many :contacts, through: :organization_contacts
end
