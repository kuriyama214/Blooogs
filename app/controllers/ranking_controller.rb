class RankingController < ApplicationController
  layout 'blog_site'
  before_action :ranking
  def ranking
    @ranking = Article.where(user_id: current_user.id).order('impressions_count DESC').limit(5)
  end
  
end