
class OrganizationContact < ApplicationRecord
  belongs_to :organization
  belongs_to :contact
end
