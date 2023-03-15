class AnimalRescue < ApplicationRecord
  has_and_belongs_to_many :contacts

  validates_presence_of :name, :breed, :website_url, :visibility

  scope :is_public, -> { where(visibility: 'public') }
  scope :is_private, -> { where(visibility: 'private') }
  scope :is_hidden, -> { where(visibility: 'hidden') }

end

