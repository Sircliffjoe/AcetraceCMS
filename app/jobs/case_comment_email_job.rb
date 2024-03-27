class CaseCommentEmailJob < ApplicationJob
  queue_as :default

   def perform(user, mycase, comment)
    @user = user
    @mycase = mycase
    @comment = comment
    NewCaseMailer.case_comment_email(@user, @mycase, @comment).deliver_later
  end

end
