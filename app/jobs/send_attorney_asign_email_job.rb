class SendAttorneyAsignEmailJob < ApplicationJob
  queue_as :default

  def perform(user, mycase)
  	@user = user
    @mycase = mycase
    NewCaseMailer.attorney_assign_email(@user, @mycase).deliver_later
  end
end

