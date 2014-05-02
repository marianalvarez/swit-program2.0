class ArticlesController < ApplicationController

 
def new
	@article = Article.new
	end

def show

  @article = Article.find(params[:id])
  
end
def edit
	@article = Article.find(params[:id])
end
def index
  @article = Article.new
  @articles = Article.all.order('created_at desc')
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
def create
  @article = Article.new(article_params)
 
  if @article.save
    @tags = @article.text.scan(/\{[^}]*\}/)
    @tags.each do |doortag|
        
        doortag=doortag.gsub(/\{/,"")
        doortag=doortag.gsub(/\}/,"")
        @doortag = Doortag.create(article_id: @article.id, tag: doortag)
        @doortag.save
 end
 
    redirect_to articles_path

  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to articles_path
  else
    render 'edit'
  end
end
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  


end
