
class Admin::OrganizationsController < ApplicationController

  def index
    authorize :index?, policy_class: AdminDashboardPolicy

    @organizations = Organization.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end