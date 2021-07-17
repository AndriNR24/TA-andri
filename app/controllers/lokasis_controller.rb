class LokasisController < ApplicationController
  before_action :set_lokasi, only: %w[ show edit update destroy ]

  # GET /lokasis
  # GET /lokasis.json
  def index
    @lokasi = Lokasi.all
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /lokasis/1
  # GET /lokasis/1.json
  def show
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /lokasis/new
  def new
    @lokasi = Lokasi.new
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /lokasis/1/edit
  def edit
    @lokasis = Rute.select("id_jalan").uniq
  end

  # POST /lokasis
  # POST /lokasis.json
  def create
    @lokasi = Lokasi.new(lokasi_params)

    respond_to do |format|
      if @lokasi.save
        format.html { redirect_to @lokasi, notice: "Lokasi was successfully created." }
        format.json { render :show, status: :created, location: @lokasi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lokasi.errors, status: :unprocessable_entity }
      end
    end
    @lokasis = Rute.select("id_jalan").uniq
  end

  # PATCH/PUT /lokasis/1
  # PATCH/PUT /lokasis/1.json
  def update
    respond_to do |format|
      if @lokasi.update(lokasi_params)
        format.html { redirect_to @lokasi, notice: "Lokasi was successfully updated." }
        format.json { render :show, status: :ok, location: @lokasi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lokasi.errors, status: :unprocessable_entity }
      end
    end
    @lokasis = Rute.select("id_jalan").uniq
  end

  # DELETE /lokasis/1
  # DELETE /lokasis/1.json
  def destroy
    @lokasi.destroy
    respond_to do |format|
      format.html { redirect_to lokasis_url, notice: "Lokasi was successfully destroyed." }
      format.json { head :no_content }
    end
    @lokasis = Rute.select("id_jalan").uniq
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lokasi
      @lokasi = Lokasi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lokasi_params
      params.require(:lokasi).permit(:id_lokasi, :id_jalan, :latitude, :longitude)
    end
end
