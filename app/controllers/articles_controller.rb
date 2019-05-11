class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    Article.create(create_params)
  end
  
  
  private
  def create_params
    params.require(:article).permit(:title,:text,:image).merge(user_id: current_user.id)
  end
end
