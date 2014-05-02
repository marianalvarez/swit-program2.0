class SwitterappsController < ApplicationController
  before_action :set_switterapp, only: [:show, :edit, :update, :destroy]

  # GET /switterapps
  # GET /switterapps.json
  def index
    @switterapps = Switterapp.all
  end

  # GET /switterapps/1
  # GET /switterapps/1.json
  def show
  end

  # GET /switterapps/new
  def new
    @switterapp = Switterapp.new
  end

  # GET /switterapps/1/edit
  def edit
  end

  # POST /switterapps
  # POST /switterapps.json
  def create
    @switterapp = Switterapp.new(switterapp_params)

    respond_to do |format|
      if @switterapp.save
        format.html { redirect_to @switterapp, notice: 'Switterapp was successfully created.' }
        format.json { render :show, status: :created, location: @switterapp }
      else
        format.html { render :new }
        format.json { render json: @switterapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /switterapps/1
  # PATCH/PUT /switterapps/1.json
  def update
    respond_to do |format|
      if @switterapp.update(switterapp_params)
        format.html { redirect_to @switterapp, notice: 'Switterapp was successfully updated.' }
        format.json { render :show, status: :ok, location: @switterapp }
      else
        format.html { render :edit }
        format.json { render json: @switterapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /switterapps/1
  # DELETE /switterapps/1.json
  def destroy
    @switterapp.destroy
    respond_to do |format|
      format.html { redirect_to switterapps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_switterapp
      @switterapp = Switterapp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def switterapp_params
      params.require(:switterapp).permit(:username, :password)
    end
end
