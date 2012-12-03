class Admin::PagesController < Admin::AdminController

  # GET /admin/pages
  # GET /admin/pages.json
  def index
    params[:type] = 'post' unless params[:type]
    @pages = Page.order('updated_at DESC').where(page_type: params[:type])
    @type = params[:type].capitalize
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /admin/pages/1
  # GET /admin/pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /admin/pages/new
  # GET /admin/pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /admin/pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /admin/pages
  # POST /admin/pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save

        url = admin_pages_url if @page.page_type == 'page'
        url = admin_posts_url if @page.page_type == 'post'

        format.html { redirect_to url, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/pages/1
  # PUT /admin/pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])

        url = admin_pages_url if @page.page_type == 'page'
        url = admin_posts_url if @page.page_type == 'post'

        format.html { redirect_to url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pages/1
  # DELETE /admin/pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to admin_pages_url }
      format.json { head :no_content }
    end
  end
end
