class RankingController < ApplicationController
  layout 'ranking'
  before_action :ranking
  def ranking
    @ranking = Article.order('impressions_count DESC').limit(5)
  end
end