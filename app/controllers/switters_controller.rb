class SwittersController < ApplicationController
  before_action :set_switter, only: [:show, :edit, :update, :destroy]

  # GET /switters
  # GET /switters.json
  def index
    @switters = Switter.all
  end

  # GET /switters/1
  # GET /switters/1.json
  def show
  end

  # GET /switters/new
  def new
    @switter = Switter.new
  end

  # GET /switters/1/edit
  def edit
  end

  # POST /switters
  # POST /switters.json
  def create
    @switter = Switter.new(switter_params)

    respond_to do |format|
      if @switter.save
        format.html { redirect_to @switter, notice: 'Switter was successfully created.' }
        format.json { render :show, status: :created, location: @switter }
      else
        format.html { render :new }
        format.json { render json: @switter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /switters/1
  # PATCH/PUT /switters/1.json
  def update
    respond_to do |format|
      if @switter.update(switter_params)
        format.html { redirect_to @switter, notice: 'Switter was successfully updated.' }
        format.json { render :show, status: :ok, location: @switter }
      else
        format.html { render :edit }
        format.json { render json: @switter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /switters/1
  # DELETE /switters/1.json
  def destroy
    @switter.destroy
    respond_to do |format|
      format.html { redirect_to switters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_switter
      @switter = Switter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def switter_params
      params.require(:switter).permit(:username, :password)
    end
end
