class InternalGearHubsController < ApplicationController
  before_action :set_internal_gear_hub, only: [:show, :edit, :update, :destroy]

  # GET /internal_gear_hubs
  # GET /internal_gear_hubs.json
  def index
    @internal_gear_hubs = InternalGearHub.all
  end

  # GET /internal_gear_hubs/1
  # GET /internal_gear_hubs/1.json
  def show
  end

  # GET /internal_gear_hubs/new
  def new
    @internal_gear_hub = InternalGearHub.new
  end

  # GET /internal_gear_hubs/1/edit
  def edit
  end

  # POST /internal_gear_hubs
  # POST /internal_gear_hubs.json
  def create
    @internal_gear_hub = InternalGearHub.new(internal_gear_hub_params)

    respond_to do |format|
      if @internal_gear_hub.save
        format.html { redirect_to @internal_gear_hub, notice: 'Internal gear hub was successfully created.' }
        format.json { render :show, status: :created, location: @internal_gear_hub }
      else
        format.html { render :new }
        format.json { render json: @internal_gear_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_gear_hubs/1
  # PATCH/PUT /internal_gear_hubs/1.json
  def update
    respond_to do |format|
      if @internal_gear_hub.update(internal_gear_hub_params)
        format.html { redirect_to @internal_gear_hub, notice: 'Internal gear hub was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_gear_hub }
      else
        format.html { render :edit }
        format.json { render json: @internal_gear_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_gear_hubs/1
  # DELETE /internal_gear_hubs/1.json
  def destroy
    @internal_gear_hub.destroy
    respond_to do |format|
      format.html { redirect_to internal_gear_hubs_url, notice: 'Internal gear hub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_gear_hub
      @internal_gear_hub = InternalGearHub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_gear_hub_params
      params.require(:internal_gear_hub).permit(:description, :chainring, :sprocket, :gear_ratio => [])
    end
end
