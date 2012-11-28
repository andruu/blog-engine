class PageSweeper < ActionController::Caching::Sweeper
  observe Page

  def sweep(page)

    if Blog.cache == :page
      
      # Page Caching
      expire_page pages_path
      expire_page page_path(page.slug)
      expire_page '/'
      expire_page archives_path
      FileUtils.rm_rf "#{page_cache_directory}/pages"

    elsif Blog.cache == :action

      # Action Caching
      expire_action controller: '/pages', action: :index
      expire_action "#{request.host}/#{page.slug}"
      expire_action controller: '/pages', action: :archives

      # Remove pages cache
      pages = (Page.published_posts.count.to_f / Blog::POSTS_PER_PAGE.to_f).ceil
      1.upto(pages) { |p| expire_action "#{request.host}/pages/#{p}" }

    end

  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end