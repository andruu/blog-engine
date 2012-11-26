class CommentsController < ApplicationController

  before_filter :authorize, only: [:destroy]

  def create
    page = Page.find(params[:comment][:page_id])

    if params[:remember_me]
      cookies[:comment_name] = params[:comment][:name]
      cookies[:comment_email] = params[:comment][:email]
      cookies[:comment_url] = params[:comment][:url]
    end

    @comment = page.comments.create params[:comment]
    render partial: 'comment', locals: { comment: @comment }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @id = params[:id]
    @comment.destroy
  end
end
