class Admin::CommentsController < Admin::AdminController
  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @comments = Comment.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /admin/comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # PUT /admin/comments/1
  # PUT /admin/comments/1.json
  def update
    @comment = Comment.find(params[:id])
    
    # Clear cache
    PageSweeper.instance.sweep(@comment.page)

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to admin_comments_url, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @comment = Comment.find(params[:id])

    # Clear cache
    PageSweeper.instance.sweep(@comment.page)

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
