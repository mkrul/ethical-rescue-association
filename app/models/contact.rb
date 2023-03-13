class Contact < ApplicationRecord
  has_many :rescues
  belongs_to :user
end
