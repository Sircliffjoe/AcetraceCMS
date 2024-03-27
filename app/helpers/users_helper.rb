module UsersHelper
	def full_name
		@user.first_name+ " "+ @user.last_name
	end
	def mycaseuser
	 count = 0
     @user_cases.each do |mycase|
		if mycase
			count +=1
		end
		end
		return count
		
	end
	def taskattorney
	 count = 0
     @tasks.each do |task|
		if task
			count +=1
		end
		end
		return count
		
	end
end
