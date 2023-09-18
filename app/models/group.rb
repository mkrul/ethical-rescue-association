class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users

  validates_uniqueness_of :name, case_sensitive: true
end
