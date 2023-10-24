class HomeServicesController < ApplicationController
  before_action :set_home_service, only: %i[ show edit update destroy ]

  # GET /home_services or /home_services.json
  def index
    @home_services = HomeService.all
  end

  # GET /home_services/1 or /home_services/1.json
  def show
  end

  # GET /home_services/new
  def new
    @home_service = HomeService.new
  end

  # GET /home_services/1/edit
  def edit
  end

  # POST /home_services or /home_services.json
  def create
    @home_service = HomeService.new(home_service_params)

    respond_to do |format|
      if @home_service.save
        format.html { redirect_to home_service_url(@home_service), notice: "Home service was successfully created." }
        format.json { render :show, status: :created, location: @home_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @home_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_services/1 or /home_services/1.json
  def update
    respond_to do |format|
      if @home_service.update(home_service_params)
        format.html { redirect_to home_service_url(@home_service), notice: "Home service was successfully updated." }
        format.json { render :show, status: :ok, location: @home_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_services/1 or /home_services/1.json
  def destroy
    @home_service.destroy

    respond_to do |format|
      format.html { redirect_to home_services_url, notice: "Home service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_service
      @home_service = HomeService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def home_service_params
      params.fetch(:home_service, {})
    end
end
