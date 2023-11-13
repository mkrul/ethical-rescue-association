
class Tag < ApplicationRecord
  has_and_belongs_to_many :organizations, through: :organizations_tags

  has_one_attached :main_photo
end
