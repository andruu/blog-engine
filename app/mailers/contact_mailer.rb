class ContactMailer < ActionMailer::Base
  default from: Blog::EMAIL

  def new_contact(contact)
    @contact = contact
    mail to: Blog::EMAIL, subject: "#{@contact.name} contacted you on #{Blog::TITLE}"
  end
end
