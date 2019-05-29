class RankingController < ApplicationController
  layout 'blog_site'
  def ranking
    @articles = Article.order('impressions_count DESC').limit(5)
  end
end