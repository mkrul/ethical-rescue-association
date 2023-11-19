
class Admin::OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]

  def index
    authorize :index?, policy_class: AdminDashboardPolicy

    @organizations = Organization.all
  end

  def new
    authorize :new?, policy_class: AdminDashboardPolicy

    @organization = Organization.new
  end

  def show
    authorize :show?, policy_class: AdminDashboardPolicy
  end

  def edit
    authorize :edit?, policy_class: AdminDashboardPolicy
  end

  def create
    authorize :create?, policy_class: AdminDashboardPolicy

    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to admin_organization_url(@organization), notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize :update?, policy_class: AdminDashboardPolicy

    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to admin_organization_url(@organization), notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize :destroy?, policy_class: AdminDashboardPolicy

    @organization.destroy

    respond_to do |format|
      format.html { redirect_to admin_organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.fetch(:organization, {}).permit(
      :name,
      :code,
      :category,
      :specialization,
      :description,
      :level,
      :ein,
      :website_url,
      :facebook_url,
      :instagram_url,
      :tiktok_url,
      :main_photo
    )
  end

end