
class Admin::ApplicationSubmissionsController < ApplicationController
  before_action :set_application_submission, only: %i[ show edit update destroy ]

  def index
    authorize :index?, policy_class: AdminDashboardPolicy

    @application_submissions = ApplicationSubmission.all
  end

  def new
    authorize :new?, policy_class: AdminDashboardPolicy

    @application_submission = ApplicationSubmission.new
  end

  def show
    authorize :show?, policy_class: AdminDashboardPolicy
  end

  def edit
    authorize :edit?, policy_class: AdminDashboardPolicy
  end

  def create
    authorize :create?, policy_class: AdminDashboardPolicy

    @application_submission = ApplicationSubmission.new(application_submission_params)

    respond_to do |format|
      if @application_submission.save
        format.html { redirect_to admin_application_submission_url(@application_submission), notice: "ApplicationSubmission was successfully created." }
        format.json { render :show, status: :created, location: @application_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize :update?, policy_class: AdminDashboardPolicy

    respond_to do |format|
      if @application_submission.update(application_submission_params)
        format.html { redirect_to admin_application_submission_url(@application_submission), notice: "ApplicationSubmission was successfully updated." }
        format.json { render :show, status: :ok, location: @application_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize :destroy?, policy_class: AdminDashboardPolicy

    @application_submission.destroy

    respond_to do |format|
      format.html { redirect_to admin_application_submissions_url, notice: "ApplicationSubmission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_application_submission
    @application_submission = ApplicationSubmission.find(params[:id])
  end

  def application_submission_params
    params.fetch(:application_submission, {}).permit(
      :category,
      :specialization,
      :status,
      :form_url,
      :response_id
    )
  end

end