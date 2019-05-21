class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(5)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    Article.create(create_params)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end
  
  private
  def create_params
    params.require(:article).permit(:title,:text,:image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
