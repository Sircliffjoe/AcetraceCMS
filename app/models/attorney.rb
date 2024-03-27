class Attorney < User
#alias_attribute :slug, :first_name
  #before_create :generate_guid
 
  before_save { self.email = email.downcase }
  #validates :first_name, presence: true, length: { maximum: 50 }
  #validates :last_name, presence: true, length: { maximum: 50 }
  #validates :phone_number, presence: true, length: { maximum: 11 }
  #validates :address, presence: true, length: { maximum: 50 }
  #validates :state, presence: true, length: { maximum: 50 }
  #validates :address, presence: true, length: { maximum: 50 }
  #validates :city, presence: true, length: { maximum: 50 }
  #validates :password_confirmation, presence: true, length: { maximum: 50 }
   mount_uploader :avatars, AvatarsUploader

  belongs_to :lawfirm
   has_and_belongs_to_many :mycases, foreign_key: :user_id
  has_many :tasks, as: :taskter, foreign_key: :taskter_id
  has_many :mycasecomments, as: :mycasecommenter, foreign_key: :mycasecommenter_id
  has_many :posts
  has_many :comments, as: :commenter, foreign_key: :commenter_id
 
  # Include default devise modules. Others available are:

  
    def full_name
      return self.first_name+" "+self.last_name
    end

 
  
     extend FriendlyId
  
    friendly_id :aliass, use: [:slugged, :history, :finders]
  def aliass
    "#{aliass1}#{first_name} #{last_name} profile"
  end

 
def aliass1
        String.random(51, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end
end