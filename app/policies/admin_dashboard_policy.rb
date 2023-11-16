
class AdminDashboardPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  def index?
    user && user.admin?
  end

  def show?
    user && user.admin?
  end

  def create?
    user && user.admin?
  end

  def update?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end

  def edit?
    user && user.admin?
  end

  def new?
    user && user.admin?
  end

end