class SweetsController < ApplicationController
  before_action :set_sweet, only: [:show, :edit, :update, :destroy]
  before_filter :load_article
  # GET /sweets
  # GET /sweets.json
  def index
    @sweets = @article.comments.all
  end

  # GET /sweets/1
  # GET /sweets/1.json
  def show
    @sweet = @article.sweets.find(params[:id])
  end

  # GET /sweets/new
  def new
    @sweet = @article.sweets.new
  end

  # GET /sweets/1/edit
  def edit
    @sweet = @article.sweets.find(params[:id])
  end

  # POST /sweets
  # POST /sweets.json
  def create
    @sweet = @article.sweets.new(params[:child])

    respond_to do |format|
      if @sweet.save
        format.html { redirect_to articles_path}
        format.json { render :show, status: :created, location: @sweet }
      else
        format.html { render :new }
        format.json { render json: @sweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sweets/1
  # PATCH/PUT /sweets/1.json
  def update
    @sweet = @article.sweets.find(params[:id])
    respond_to do |format|
      if @sweet.update(sweet_params)
        format.html { redirect_to [@article, @sweet], notice: 'Sweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @sweet }
      else
        format.html { render :edit }
        format.json { render json: @sweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sweets/1
  # DELETE /sweets/1.json
  def destroy
    @sweet = @article.sweets.find(params[:id])
    @sweet.destroy
    respond_to do |format|
      format.html { redirect_to article_sweets_path(@article) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sweet
      @sweet = Sweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sweet_params
      params.require(:sweet).permit(:commenter, :article_id)
    end

    def load_article
    @article = Article.find(params[:article_id])
  end
end
