class PagesController < ApplicationController

  def index
    @pages = Page.published_posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @page = Page.published.find_by_slug(params[:slug])
    return redirect_to root_path unless @page
    @comment = Comment.new
  end

  def archives
    posts = Page.published_posts.order('created_at DESC').select("id, title, slug, extract(month from created_at) as month, extract(year from created_at) as year")
    @posts = {}

    posts.each do |post|
      date = "#{Date::MONTHNAMES[post.month.to_i]} #{post.year}"
      @posts[date] ||= []
      @posts[date] << post
    end

  end
end
