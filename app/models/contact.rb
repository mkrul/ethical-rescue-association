class Contact < ApplicationRecord
  has_many :animal_rescues
  belongs_to :user
end
