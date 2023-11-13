class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :donations
  has_many :application_submissions

  has_one :organization_users, class_name: 'OrganizationUser'
  has_one :organization, through: :organization_users

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

  def has_pending_application?
    application_submissions.where(status: 'pending_submission').any?
  end
end

