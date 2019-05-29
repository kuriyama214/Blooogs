class Article < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_presence_of :user_id, :text, optional: true
    is_impressionable counter_cache: true#viewcountオプション
    
    
    def self.search(search)
      return Article.all unless search
      Article.where(['text LIKE ? or title LIKE ?', "%#{search}%", "%#{search}%"])
    end
    
    def divide_monthly
      return self.articles.group("strftime('%Y%m', articles.created_at)")
                        .order(Arel.sql("strftime('%Y%m', articles.created_at) desc"))
                        .count
    end
end