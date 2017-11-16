class PhaseLevelsController < ApplicationController
  before_action :set_phase_level, only: [:show, :edit, :update, :destroy]

  # GET /phase_levels
  # GET /phase_levels.json
  def index
    @phase_levels = PhaseLevel.all
  end

  # GET /phase_levels/1
  # GET /phase_levels/1.json
  def show
  end

  # GET /phase_levels/new
  def new
    @phase_level = PhaseLevel.new
  end

  # GET /phase_levels/1/edit
  def edit
  end

  # POST /phase_levels
  # POST /phase_levels.json
  def create
    @phase_level = PhaseLevel.new(phase_level_params)

    respond_to do |format|
      if @phase_level.save
        format.html { redirect_to @phase_level, notice: 'Phase level was successfully created.' }
        format.json { render :show, status: :created, location: @phase_level }
      else
        format.html { render :new }
        format.json { render json: @phase_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phase_levels/1
  # PATCH/PUT /phase_levels/1.json
  def update
    respond_to do |format|
      if @phase_level.update(phase_level_params)
        format.html { redirect_to @phase_level, notice: 'Phase level was successfully updated.' }
        format.json { render :show, status: :ok, location: @phase_level }
      else
        format.html { render :edit }
        format.json { render json: @phase_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phase_levels/1
  # DELETE /phase_levels/1.json
  def destroy
    @phase_level.destroy
    respond_to do |format|
      format.html { redirect_to phase_levels_url, notice: 'Phase level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase_level
      @phase_level = PhaseLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_level_params
      params.require(:phase_level).permit(:name)
    end
end
