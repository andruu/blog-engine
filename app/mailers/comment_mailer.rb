class CommentMailer < ActionMailer::Base
  default from: "andru.weir@gmail.com"

  def new_comment(comment)
    @comment = comment
    mail to: "andru.weir@gmail.com", subject: "New comment on andru.co: #{comment.page.title}"
  end
end
