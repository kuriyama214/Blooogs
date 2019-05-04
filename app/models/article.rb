class Article < ApplicationRecord
    belongs_to :user
    
    validates_presence_of :user_id, :text
end
