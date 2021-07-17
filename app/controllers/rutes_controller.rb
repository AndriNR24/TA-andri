class RutesController < ApplicationController
  before_action :set_rute, only: %i[ show edit update destroy ]

  # GET /rutes or /rutes.json
  def index
    @rutes = Rute.all
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /rutes/1 or /rutes/1.json
  def show
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /rutes/new
  def new
    @rute = Rute.new
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /rutes/1/edit
  def edit
  @lokasis = Rute.select("id_jalan").uniq
  end


  # POST /rutes or /rutes.json
  def create
    @rute = Rute.new(rute_params)

    respond_to do |format|
      if @rute.save
        format.html { redirect_to @rute, notice: "Rute was successfully created." }
        format.json { render :show, status: :created, location: @rute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rutes/1 or /rutes/1.json
  def update
    respond_to do |format|
      if @rute.update(rute_params)
        format.html { redirect_to @rute, notice: "Rute was successfully updated." }
        format.json { render :show, status: :ok, location: @rute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rutes/1 or /rutes/1.json
  def destroy
    @rute.destroy
    respond_to do |format|
      format.html { redirect_to rutes_url, notice: "Rute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rute
      @rute = Rute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rute_params
      params.require(:rute).permit(:latitude, :longitude)
    end
end
