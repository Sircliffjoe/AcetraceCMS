class Mycase < ApplicationRecord
  enum status: [:open, :inview, :completed]
  # belongs_to :mycase, optional: true
  has_many :mycasecomments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :billings, dependent: :destroy
  belongs_to :lawfirm
  has_and_belongs_to_many :users
  belongs_to :client, foreign_key: :client_id
    
    #belongs_to :admin,  class_name: 'User',foreign_key: :admin_id,optional: true, optional: true
    #belongs_to :adminassistance, class_name: 'User',foreign_key: :adminassistance_id, optional: true
  attr_readonly :caseNo
  #has_many :users


  #accepts_nested_attributes_for :users
  #has_many :mycase_users
  belongs_to :admin, foreign_key: :admin_id
    #has_many :users
 
  #attr_accessible :created_at, :attorney_user_id
  
   
  def mycase_notifiable_path
    mycase_path(self.id)
  end


   def start_time
        self.arrival_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end

    def end_time
        self.due_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end


     extend FriendlyId
  
    friendly_id :generate_caseNo, use: [:slugged, :history, :finders]
   



def generate_caseNo
        String.random(51, ['0'..'9','A'..'Z'] )

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



end
