class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def self.search(query)
    sanitized_query = Article.sanitize_sql_like(query)
    Article.where('title LIKE :query OR content LIKE :query', query: "%#{sanitized_query}%")
  end
end
