class UpdateCaseEmailJob < ApplicationJob
  queue_as :default

  def perform(user, mycase)
    @user = user
    @mycase = mycase
    NewCaseMailer.update_case_email(@user, @mycase).deliver_later
  end
  
end
