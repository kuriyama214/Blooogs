class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    Article.create(create_params)
    binding.pry
  end
  
  
  private
  def create_params
    params.require(:article).permit(:title,:text,:image)
  end
end
