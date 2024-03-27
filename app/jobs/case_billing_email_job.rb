class CaseBillingEmailJob < ApplicationJob
  queue_as :default

   def perform(user, mycase, billing)
    @user = user
    @mycase = mycase
    @billing = billing
    NewCaseMailer.case_billing_email(@user, @mycase, @billing).deliver_later
  end

end


     