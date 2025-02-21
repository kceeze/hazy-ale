class Article < ApplicationRecord
    validates :title, presence: true, length: {maximum: 40}
    validates :content, presence: true
    validates :author, presence: true
    validates :category, presence: true
    validates :published_at, presence: true
end
