class NewCaseMailer < ApplicationMailer
	default from: 'info@acetracecms.com'
	def new_case_email(user, mycase)
    	@user = user
    	@mycase = mycase
    	mail(to: @user.email, subject: 'New Legal Case has been created')
  	end

  	def attorney_assign_email(user, mycase)
    	@user = user
    	@mycase = mycase
    	mail(to: @user.email, subject: 'Attorney has been assigned to your Legal Case')
  	end

    def update_case_email(user, mycase)
      @user = user
      @mycase = mycase
      mail(to: @user.email, subject: 'Legal Case has been updated')
    end

    def case_task_email(user, mycase, task)
      @user = user
      @mycase = mycase
      @task = task
      mail(to: @user.email, subject: 'Legal Case Task has been created')
    end

    def case_comment_email(user, mycase, comment)
      @user = user
      @mycase = mycase
      @comment = comment
      mail(to: @user.email, subject: 'Someone Posted discussion on Legal Case')
    end


    def case_billing_email(user, mycase, billing)
      @user = user
      @mycase = mycase
      @billing = billing
      mail(to: @user.email, subject: 'Legal Case Billing has been posted')
    end

    def case_billing_approved_email(user, mycase)
      @user = user
      @mycase = mycase
      mail(to: @user.email, subject: 'Legal Case Billing has been posted')
    end


end

