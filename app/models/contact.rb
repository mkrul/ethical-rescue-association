class Contact < ApplicationRecord
  has_one :organization_contact
  has_one :organization, through: :organization_contact
end
