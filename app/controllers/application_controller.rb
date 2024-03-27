class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :notify
  before_action :perform
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :avatars,  :birthday, :address,:phone_number, :state,:city, :lawfirm_id, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
	devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :last_name, :avatars, :avatars_cache, :birthday, :address,:phone_number, :state,:city, :lawfirm_id, :email, :password, :current_password, :remember_me)}
  end

def notify
  if current_user
    @ncount = Notification.unread_count(current_user)
  else
    @ncount = 0
  end
end

   def perform
    lawfirms = Lawfirm.all

    	lawfirms.each do |f|
  			if f.transactions.any?
    			last_trans = f.transactions.last
    			if Date.today > last_trans.expires_on
     			 	f.update(status: 0)
    			end
  			end
  		end

  end
   
end
