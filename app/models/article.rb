class Article < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_presence_of :user_id, :text, optional: true
    is_impressionable counter_cache: true#viewcountオプション
    
    
    def self.search(search)
      return Article.all unless search
      Article.where(['text LIKE ? or title LIKE ?', "%#{search}%", "%#{search}%"])
    end
    
end