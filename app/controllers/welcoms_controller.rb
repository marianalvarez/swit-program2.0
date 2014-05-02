class WelcomsController < ApplicationController
  before_action :set_welcom, only: [:show, :edit, :update, :destroy]

  # GET /welcoms
  # GET /welcoms.json
  def index
    @welcoms = Welcom.all
  end

  # GET /welcoms/1
  # GET /welcoms/1.json
  def show
  end

  # GET /welcoms/new
  def new
    @welcom = Welcom.new
  end

  # GET /welcoms/1/edit
  def edit
  end

  # POST /welcoms
  # POST /welcoms.json
  def create
    @welcom = Welcom.new(welcom_params)

    respond_to do |format|
      if @welcom.save
        format.html { redirect_to @welcom, notice: 'Welcom was successfully created.' }
        format.json { render :show, status: :created, location: @welcom }
      else
        format.html { render :new }
        format.json { render json: @welcom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /welcoms/1
  # PATCH/PUT /welcoms/1.json
  def update
    respond_to do |format|
      if @welcom.update(welcom_params)
        format.html { redirect_to @welcom, notice: 'Welcom was successfully updated.' }
        format.json { render :show, status: :ok, location: @welcom }
      else
        format.html { render :edit }
        format.json { render json: @welcom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcoms/1
  # DELETE /welcoms/1.json
  def destroy
    @welcom.destroy
    respond_to do |format|
      format.html { redirect_to welcoms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcom
      @welcom = Welcom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcom_params
      params.require(:welcom).permit(:username, :password)
    end
end
