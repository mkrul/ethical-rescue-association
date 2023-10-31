class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :donations
  has_many :application_submissions

  validates_uniqueness_of :email, case_sensitive: false

  def admin?
    admin == true
  end

  def developer?
    groups.include?(Group.find_by(name: 'Developers'))
  end

  def tester?
    groups.include?(Group.find_by(name: 'Testers'))
  end

  def banned?
    groups.include?(Group.find_by(name: 'Blacklisted'))
  end
end

