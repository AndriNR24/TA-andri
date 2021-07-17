class AngkutansController < ApplicationController
  before_action :set_angkutan, only: %w[ show edit update destroy ]

  # GET /angkutans
  # GET /angkutans.json
  def index
    @angkutans = Angkutan.all
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /angkutans/1
  # GET /angkutans/1.json
  def show
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /angkutans/new
  def new
    @angkutan = Angkutan.new
    @lokasis = Rute.select("id_jalan").uniq
  end

  # GET /angkutans/1/edit
  def edit
    @lokasis = Rute.select("id_jalan").uniq
  end

  # POST /angkutans
  # POST /angkutans.json
  def create
    @angkutan = Angkutan.new(angkutan_params)

    respond_to do |format|
      if @angkutan.save
        format.html { redirect_to @angkutan, notice: "Angkutan was successfully created." }
        format.json { render :show, status: :created, location: @angkutan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @angkutan.errors, status: :unprocessable_entity }
      end
    end
    @lokasis = Rute.select("id_jalan").uniq
  end

  # PATCH/PUT /angkutans/1
  # PATCH/PUT /angkutans/1.json
  def update

    @lokasis = Rute.select("id_jalan").uniq
    
    respond_to do |format|
      if @angkutan.update(angkutan_params)
        format.html { redirect_to @angkutan, notice: "Angkutan was successfully updated." }
        format.json { render :show, status: :ok, location: @angkutan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @angkutan.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /angkutans/1
  # DELETE /angkutans/1.json
  def destroy
    @angkutan.destroy
    respond_to do |format|
      format.html { redirect_to angkutans_url, notice: "Angkutan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_angkutan
      @angkutan = Angkutan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def angkutan_params
      params.require(:angkutan).permit(:id_angkutan, :id_trayek)
    end
end
