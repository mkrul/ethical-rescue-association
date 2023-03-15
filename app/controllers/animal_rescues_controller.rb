class AnimalRescuesController < ApplicationController
  before_action :set_rescues
  before_action :set_rescue, only: %i(edit update show destroy)

  def index
  end

  def new
    @rescue = AnimalRescue.new
  end

  def create
    if logged_in_as_admin?
      @rescue = AnimalRescue.new(rescue_params)

      respond_to do |format|
        if @rescue.save
          format.html { redirect_to animal_rescue_url(@rescue), notice: "Rescue was successfully created." }
          format.json { render :show, status: :created, location: @rescue }
        else
          flash.now[:alert] = "Unable to create rescue. #{@rescue.errors.full_messages.to_sentence}."
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @rescue.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    if logged_in_as_admin?
      respond_to do |format|
        if @rescue.update(rescue_params)
          format.html { redirect_to animal_rescue_url(@rescue), notice: "Rescue was successfully updated." }
          format.json { render :show, status: :created, location: @rescue }
        else
          flash.now[:alert] = "Unable to create rescue. #{@rescue.errors.full_messages.to_sentence}."
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @rescue.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if logged_in_as_admin?
      @rescue.delete

      respond_to do |format|
        format.html { redirect_to animal_rescues_path, notice: "Rescue was successfully deleted." }
        format.json { render :show, status: :created, location: @rescue }
      end
    end
  end

  private

  def set_rescue
    @rescue = AnimalRescue.find(params[:id])
  end

  def rescue_params
    params.require(:animal_rescue).permit(
      :name, :breed, :website_url, :description, :visibility
    )
  end

  def set_rescues
    if logged_in_as_admin?
      @rescues = AnimalRescue.all.order('id ASC')
    else
      @rescues = AnimalRescue.is_public.order('id ASC')
    end
  end
end
