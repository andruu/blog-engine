module Blog

  def self.env
    defined?(Rails) ? Rails.env : ENV['RACK_ENV']
  end

  # Caching
  def self.cache
    # Options :page or :action (you can return anything else for no caching)
    if Blog.env == 'development'
      return :page
    elsif Blog.env == 'production'
      return :action
    end
  end

  # Title of blog
  TITLE = 'andru.co'

  # Url of blog
  URL = 'andru.co'
  
  # Email for comments
  EMAIL = 'andru.weir@gmail.com'

  # Path to clear cache, used for deployment hook or to clear cache from the browser
  CLEAR_CACHE_PATH = ENV['CLEAR_CACHE_PATH'] || 'clear/the/cache'

  # Sidebar
  NAME         = 'Andrew Weir'
  BLURB        = 'Entrepreneur & web developer specializing in Ruby, Node.js and PHP.'
  GITHUB       = 'andruu'
  TWITTER      = 'andruu'
  LINKEDIN     = 'andruu'
  LOCATION     = 'Toronto, Canada'
  RECENT_POSTS = 3

  # Page settings
  POSTS_PER_PAGE   = 5
  POSTS_PER_SEARCH = 10

  # 3rd Party
  GOOGLE_ANALYTICS = 'UA-36592122-1'
  RSS              = 'http://feeds.feedburner.com/Andruco'

  # Memcache Settings
  MEMCACHE_SERVERS  = ENV['MEMCACHE_SERVERS']
  MEMCACHE_USERNAME = ENV['MEMCACHE_USERNAME']
  MEMCACHE_PASSWORD = ENV['MEMCACHE_PASSWORD']

  # SMTP Settings
  SMTP_PORT           = ENV['MAILGUN_SMTP_PORT']
  SMTP_ADDRESS        = ENV['MAILGUN_SMTP_SERVER']
  SMTP_USER_NAME      = ENV['MAILGUN_SMTP_LOGIN']
  SMTP_PASSWORD       = ENV['MAILGUN_SMTP_PASSWORD']
  SMTP_DOMAIN         = 'app9499505.mailgun.org'
  SMTP_AUTHENTICATION = :plain

end