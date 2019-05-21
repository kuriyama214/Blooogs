class Article < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_presence_of :user_id, :text, optional: true
    
end
