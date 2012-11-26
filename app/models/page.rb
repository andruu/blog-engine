class Page < ActiveRecord::Base
  attr_accessible :body, :has_comments, :title, :slug, :page_type, :is_published

  has_many :comments

  scope :published, where(is_published: true)
  scope :posts, where(page_type: 'post')
  scope :published_posts, published.posts

  validates :title, presence: true, length: { in: 3..255 }
  validates :slug, presence: true, uniqueness: true, length: { in: 3..255 }
  validates :body, presence: true, length: { minimum: 100 }

end
