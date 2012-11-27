class SessionsController < ApplicationController

  after_filter :prepare_unobtrusive_flash
  
  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      cookies[:logged_in] = true
      redirect_to root_url, notice: 'Logged in.'
    else
      flash.now.alert = "Email or password is incorrect."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:logged_in] = false
    redirect_to root_url, notice: 'Logged out.'
  end
end
