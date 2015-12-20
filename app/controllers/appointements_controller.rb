class AppointementsController < ApplicationController
  before_action :set_appointement, only: [:show, :edit, :update, :destroy]

  # GET /appointements
  # GET /appointements.json
  def index
    @appointements = Appointement.all
  end

  # GET /appointements/1
  # GET /appointements/1.json
  def show
  end

  # GET /appointements/new
  def new
    @appointement = Appointement.new
  end

  # GET /appointements/1/edit
  def edit
  end

  # POST /appointements
  # POST /appointements.json
  def create
    @appointement = Appointement.new(appointement_params)

    respond_to do |format|
      if @appointement.save
        format.html { redirect_to @appointement, notice: 'Appointement was successfully created.' }
        format.json { render :show, status: :created, location: @appointement }
      else
        format.html { render :new }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointements/1
  # PATCH/PUT /appointements/1.json
  def update
    respond_to do |format|
      if @appointement.update(appointement_params)
        format.html { redirect_to @appointement, notice: 'Appointement was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointement }
      else
        format.html { render :edit }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointements/1
  # DELETE /appointements/1.json
  def destroy
    @appointement.destroy
    respond_to do |format|
      format.html { redirect_to appointements_url, notice: 'Appointement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointement
      @appointement = Appointement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointement_params
      params.require(:appointement).permit(:references, :description)
    end
end
