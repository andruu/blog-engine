class UsersController < ApplicationController

  after_filter :prepare_unobtrusive_flash
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_url, notice: 'Thanks for signing up.'
    else
      render 'new'
    end
  end

  def show
    
  end
end
