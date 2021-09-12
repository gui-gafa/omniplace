class CarMaintenancesController < ApplicationController
  before_action :set_car_maintenance, only: [:show, :edit, :update, :destroy]

  # GET /car_maintenances
  def index
    @car_maintenances = policy_scope(CarMaintenance)
  end

  # GET /car_maintenances/1
  def show
  end

  # GET /car_maintenances/new
  def new
    @car_maintenance = CarMaintenance.new
    authorize @car_maintenance
  end

  # GET /car_maintenances/1/edit
  def edit
  end

  # POST /car_maintenances
  def create
    @car_maintenance = CarMaintenance.new(car_maintenance_params)
    authorize @car_maintenance
    if @car_maintenance.save
      redirect_to @car_maintenance, notice: 'Car maintenance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /car_maintenances/1
  def update
    if @car_maintenance.update(car_maintenance_params)
      redirect_to @car_maintenance, notice: 'Car maintenance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /car_maintenances/1
  def destroy
    @car_maintenance.destroy
    redirect_to car_maintenances_url, notice: 'Car maintenance was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_maintenance
      @car_maintenance = CarMaintenance.find(params[:id])
      authorize @car_maintenance
    end

    # Only allow a trusted parameter "white list" through.
    def car_maintenance_params
      params.require(:car_maintenance).permit(:value, :description, :date, :warranty, :car_id, documents: [])
    end
end
