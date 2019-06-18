class ArticlesController < RankingController
  before_action :move_to_index, except: :index
  impressionist :actions=>[:show]
  layout 'blog_site'
  
  def index
    @articles = Article.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(5)
  end
  
  def new
    @article = Article.new
    render :new, layout: "application"
  end
  
  def create
    Article.create(create_params)
  end
  
  def show
    @article = Article.find(params[:id])
    impressionist(@article, nil, :unique => [:session_hash])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    article.update(update_params) if article.user_id == current_user.id
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end

  def search
    @articles = Article.search(params[:search]).order("id DESC")
    　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　.page(params[:page]).per(5)
  end
  
  
  
  
  
  private
  def create_params
    params.require(:article).permit(:title,:subtitle,:text,:image).merge(user_id: current_user.id)
  end
  
  def update_params
    params.require(:article).permit(:title,:subtitle,:text,:image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
