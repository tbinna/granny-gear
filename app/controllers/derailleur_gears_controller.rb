class DerailleurGearsController < ApplicationController
  before_action :set_derailleur_gear, only: [:show, :edit, :update, :destroy]

  # GET /derailleur_gears
  # GET /derailleur_gears.json
  def index
    @derailleur_gears = DerailleurGear.all
  end

  # GET /derailleur_gears/1
  # GET /derailleur_gears/1.json
  def show
  end

  # GET /derailleur_gears/new
  def new
    @derailleur_gear = DerailleurGear.new
  end

  # GET /derailleur_gears/1/edit
  def edit
  end

  # POST /derailleur_gears
  # POST /derailleur_gears.json
  def create
    @derailleur_gear = DerailleurGear.new(derailleur_gear_params)

    respond_to do |format|
      if @derailleur_gear.save
        format.html { redirect_to @derailleur_gear, notice: 'Derailleur gear was successfully created.' }
        format.json { render :show, status: :created, location: @derailleur_gear }
      else
        format.html { render :new }
        format.json { render json: @derailleur_gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derailleur_gears/1
  # PATCH/PUT /derailleur_gears/1.json
  def update
    respond_to do |format|
      if @derailleur_gear.update(derailleur_gear_params)
        format.html { redirect_to @derailleur_gear, notice: 'Derailleur gear was successfully updated.' }
        format.json { render :show, status: :ok, location: @derailleur_gear }
      else
        format.html { render :edit }
        format.json { render json: @derailleur_gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derailleur_gears/1
  # DELETE /derailleur_gears/1.json
  def destroy
    @derailleur_gear.destroy
    respond_to do |format|
      format.html { redirect_to derailleur_gears_url, notice: 'Derailleur gear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derailleur_gear
      @derailleur_gear = DerailleurGear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derailleur_gear_params
      params.require(:derailleur_gear).permit(:name, :chainring, :cassette)
    end
end
