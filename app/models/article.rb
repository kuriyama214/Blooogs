class Article < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_presence_of :user_id, :text, optional: true
    
    
    def self.search(search)
      return Article.all unless search
      Article.where(['text LIKE ? or title LIKE ?', "%#{search}%", "%#{search}%"])
    end
    
end
