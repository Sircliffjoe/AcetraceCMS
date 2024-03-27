class CaseBillingApprovedEmailJob < ApplicationJob
  queue_as :default

   def perform(user, mycase)
    @user = user
    @mycase = mycase
    NewCaseMailer.case_billing_email(@user, @mycase).deliver_later
  end

end
