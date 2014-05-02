class SoursController < ApplicationController
  before_action :set_sour, only: [:show, :edit, :update, :destroy]
  before_filter :load_article
  # GET /sours
  # GET /sours.json
  def index
    @sours = @article.sours.all
  end

  # GET /sours/1
  # GET /sours/1.json
  def show
    @sour =@article.sours.find(params[:id])
  end

  # GET /sours/new
  def new
    @sour = @article.sours.new
  end

  # GET /sours/1/edit
  def edit
    @sour =@article.sours.find(params[:id])
  end

  # POST /sours
  # POST /sours.json
  def create
    @sour = @article.sours.new(params[:child])

    respond_to do |format|
      if @sour.save
        format.html { redirect_to articles_path}
        format.json { render :show, status: :created, location: @sour }
      else
        format.html { render :new }
        format.json { render json: @sour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sours/1
  # PATCH/PUT /sours/1.json
  def update
    @sour =@article.sours.find(params[:id])
    respond_to do |format|
      if @sour.update(sour_params)
        format.html { redirect_to [@article, @sour], notice: 'Sour was successfully updated.' }
        format.json { render :show, status: :ok, location: @sour }
      else
        format.html { render :edit }
        format.json { render json: @sour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sours/1
  # DELETE /sours/1.json
  def destroy
    @sour =@article.sours.find(params[:id])
    @sour.destroy
    respond_to do |format|
      format.html { redirect_to sours_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sour
      @sour = Sour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sour_params
      params.require(:sour).permit(:commenter, :article_id)
    end

    def load_article
    @article = Article.find(params[:article_id])
  end


end
