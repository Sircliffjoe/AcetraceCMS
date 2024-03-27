class NewCaseEmailJob < ApplicationJob
  queue_as :default

  def perform(user, mycase)
    @user = user
    @mycase = mycase
    NewCaseMailer.new_case_email(@user, @mycase).deliver_later
  end
end

