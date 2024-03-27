class WelcomeMailer < ApplicationMailer
	default from: 'info@acetracecms.com'
	def welcome_email(user)
    	@user = user
    	mail(to: @user.email, subject: 'Welcome to Acetrace-CMS')
  	end


end
