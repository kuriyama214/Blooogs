class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
  end
  
  def create
    Article.create(create_params)
  end
  
  
  private
  def create_params
    params.require(:article).permit(:text,:image)
  end
end
