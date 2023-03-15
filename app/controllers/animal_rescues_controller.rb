class AnimalRescuesController < ApplicationController
  before_action :set_rescues

  def index
  end

  def new
    @rescue = AnimalRescue.new
  end

  def create
    @rescue = AnimalRescue.new(rescue_params)

    respond_to do |format|
      if @rescue.save
        format.html { redirect_to animal_rescue_url(@rescue), notice: "Rescue was successfully created." }
        format.json { render :show, status: :created, location: @rescue }
      else
        Rails.logger.info "FAILED"
        format.html { render :new, status: :unprocessable_entity, alert: "Unable to create rescue." }
        format.json { render json: @rescue.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def rescue_params
    params.require(:animal_rescue).permit(
      :name, :breed, :website_url, :description, :visibility
    )
  end

  def set_rescues
    if current_user.admin?
      @rescues = AnimalRescue.all.order('id ASC')
    else
      @rescues = AnimalRescue.is_public.order('id ASC')
    end
  end
end
