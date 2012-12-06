class ContactController < ApplicationController

  after_filter :prepare_unobtrusive_flash

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver
      redirect_to root_url, notice: "Message sent! I will get back to you as soon as humanly possible."
    else
      render 'new'
    end
  end
end
