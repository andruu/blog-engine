class Comment < ActiveRecord::Base
  attr_accessible :comment, :name, :page_id, :url, :email
  belongs_to :page, counter_cache: true

  validates :name, presence: true, length: { in: 2..255 }
  validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :url, allow_blank: true, format: { with: URI::regexp(%w(http https)) }
  validates :comment, presence: true
end
