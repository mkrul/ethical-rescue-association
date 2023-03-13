class UsersContact < ApplicationRecord
  belongs_to :user
  belongs_to :contact
end
