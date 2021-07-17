class JalansController < ApplicationController
  before_action :set_jalan, only: %w[ show edit update destroy ]

  # GET /jalans
  # GET /jalans.json
  def index
    @jalans = Jalan.all
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /jalans/1
  # GET /jalans/1.json
  def show
  end

  # GET /jalans/new
  def new
    @jalan = Jalan.new
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /jalans/1/edit
  def edit
  end

  # POST /jalans
  # POST /jalans.json
  def create
    @lokasis = Rute.select("id_jalan").uniq
    @jalan = Jalan.new(jalan_params)

    respond_to do |format|
      if @jalan.save
        format.html { redirect_to @jalan, notice: "Jalan was successfully created." }
        format.json { render :show, status: :created, location: @jalan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jalan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jalans/1
  # PATCH/PUT /jalans/1.json
  def update
    respond_to do |format|
      if @jalan.update(jalan_params)
        format.html { redirect_to @jalan, notice: "Jalan was successfully updated." }
        format.json { render :show, status: :ok, location: @jalan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jalan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jalans/1
  # DELETE /jalans/1.json
  def destroy
    @jalan.destroy
    respond_to do |format|
      format.html { redirect_to jalans_url, notice: "Jalan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jalan
      @jalan = Jalan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jalan_params
      params.require(:jalan).permit(:id_jalan, :nama_jalan, :latitude, :longitude)
    end
end
