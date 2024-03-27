module MycasesHelper

	def attorneylist
		@attorneys.each do |attorney|
			attorney.first_name+" "+attorney.last_name
		end
	end
	

	def mycasecount
	 count = 0
     current_user.mycases.each do |mycase|
		if mycase
			count +=1
		end
		end
		return count
		
	end
	
	def full_name
		@users = User.all
		@user.first_name+ " "+ @user.last_name
	end
	
	def generate_caseNo
		lawfirm = @lawfirm.name
		a=String.random(20, ['0'..'9','A'..'Z'] )

		b=caseId_gen(lawfirm)
		@gen = b+"-"+a
		
	end
	
	
	class String
	def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
  # Create a random String of given length, using given character set
  #
  # Character set is an Array which can contain Ranges, Arrays, Characters
  #
  # Examples
  #
  #     String.random
  #     => "D9DxFIaqR3dr8Ct1AfmFxHxqGsmA4Oz3"
  #
  #     String.random(10)
  #     => "t8BIna341S"
  #
  #     String.random(10, ['a'..'z'])
  #     => "nstpvixfri"
  #
  #     String.random(10, ['0'..'9'] )
  #     => "0982541042"
  #
     
  #     => "3EBF48AD3D"
  #
  #     BASE64_CHAR_SET =  ["A".."Z", "a".."z", "0".."9", '_', '-']
  #     String.random(10, BASE64_CHAR_SET)
  #     => "xM_1t3qcNn"
  #
  #     SPECIAL_CHARS = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "|", "/", "?", ".", ",", ";", ":", "~", "`", "[", "]", "{", "}", "<", ">"]
  #     BASE91_CHAR_SET =  ["A".."Z", "a".."z", "0".."9", SPECIAL_CHARS]
  #     String.random(10, BASE91_CHAR_SET)
  #      => "S(Z]z,J{v;"
  #
  # CREDIT: Tilo Sloboda
  #
  # SEE: https://gist.github.com/tilo/3ee8d94871d30416feba
  #
  # TODO: Move to random.rb in standard library?

  

end





def caseId_gen(lawfirm_name)
	num = ""
	gen = []
	
	lawfirm_name.split().each { |g|  num += g.slice( /\w/ ) }
	#puts(gen)
	#
	#	puts(gen.slice( (/\w+/ ) ))
	
	#num = ""
	#num += alp
	#puts(lawfirm_name)
	
	return num
	end
	#puts
	

	
	
end
