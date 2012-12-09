class Page < ActiveRecord::Base

  acts_as_taggable

  attr_accessible :body, :has_comments, :title, :slug, :page_type, :is_published, :tag_list

  has_many :comments

  scope :published, where(is_published: true)
  scope :posts, where(page_type: 'post')
  scope :pages, where(page_type: 'page')
  scope :published_posts, published.posts

  validates :title, presence: true, length: { in: 3..255 }
  validates :slug, presence: true, uniqueness: true, length: { in: 3..255 }
  validates :body, presence: true, length: { minimum: 100 }

  def self.tags_to_a
    tag_counts.collect { |tag| tag.name }
  end

  def self.text_search(query)
    if query.present?
      search(body: query).published
    else
      scoped
    end
  end

  def previous
    Page.published_posts.where("id < ?", id).order('id ASC').last
  end

  def next
    Page.published_posts.where("id > ?", id).order('id ASC').first
  end

end
