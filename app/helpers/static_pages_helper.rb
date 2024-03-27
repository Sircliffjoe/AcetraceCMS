module StaticPagesHelper
# Returns the full title on a per-page basis.
	def full_title( page_title = '' )
		base_title = "Acetrace Case Management System"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end


	def lawfirmusercount
	 count = 0
	 if @lawfirm_users 
     @lawfirm_users.each do |user| 
		if user
			count +=1
		end
		end
	end
		return count
		
	end

	def attorneyscount
	 count = 0
	 if @lawfirm_attorneys 
    @lawfirm_attorneys.each do |user|
		if user
			count +=1
		end
		end
	end
		return count
		
	end

	def lawfirmscount
	 count = 0
	 if @lawfirms 
    @lawfirms.each do |lawfirm|
		if lawfirm
			count +=1
		end
		end
	end
		return count
		
	end


	def alluser
	 count = 0
	 if @usersalls 
    @usersalls.each do |lawfirm|
		if lawfirm
			count +=1
		end
		end
	end
		return count
		
	end

	def allcases
	 count = 0
	 if @mycases
    @mycases.each do |lawfirm|
		if lawfirm
			count +=1
		end
		end
	end
		return count
		
	end


   def attorneycases
   		count = 0
   		if current_user.mycases
   	current_user.mycases.each do |user|
		if user
			count +=1
		end
		end
	end
		return count


   end

def usercases
   		count = 0
   		if @user_cases 
   	@user_cases.each do |user|
		if user
			count +=1
		end
		end
	end
		return count


   end





	def clientscount
	 count = 0
	 if @clients 
    @clients.each do |user|
		if user
			count +=1
		end
		end
	end
		return count
		
	end


	def adminscount
	 count = 0
	 if @admins
    @admins.each do |user|
		if user
			count +=1
		end
		end
	end
		return count
		
	end


def lawfirmcasescount
	 count = 0
	 if @lawfirm_cases
    @lawfirm_cases.each do |user|
		if user
			count +=1
		end
		end
	end
		return count
		
	end




end
