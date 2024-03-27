# Preview all emails at http://localhost:3000/rails/mailers/new_case_mailer
class NewCaseMailerPreview < ActionMailer::Preview
	def new_case_mail_preview
    	NewCaseMailer.new_case_email(User.first, Mycase.first)
  	end

  	def attorney_assign_mail_preview
    	NewCaseMailer.attorney_assign_email(User.first, Mycase.first)
    end

    def update_case_mail_preview
    	NewCaseMailer.update_case_email(User.first, Mycase.first)
  	end

  	def case_task_mail_preview
    	NewCaseMailer.case_task_email(User.first, Mycase.first, Task.first)
  	end

  	def case_comment_mail_preview
    	NewCaseMailer.case_comment_email(User.first, Mycase.first, Mycasecomment.first)
  	end

  	def case_billing_mail_preview
    	NewCaseMailer.case_billing_email(User.first, Mycase.first, Billing.first)
  	end

  		def case_billing_approved_mail_preview
    	NewCaseMailer.case_billing_approved_email(User.first, Mycase.first)
  	end


end

