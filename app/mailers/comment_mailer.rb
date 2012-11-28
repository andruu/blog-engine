class CommentMailer < ActionMailer::Base
  default from: Blog::EMAIL

  def new_comment(comment)
    @comment = comment
    mail to: Blog::EMAIL, subject: "New comment on #{Blog::TITLE}: #{comment.page.title}"
  end
end
