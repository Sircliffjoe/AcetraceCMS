class User < ApplicationRecord
  #alias_attribute :slug, :first_name
  #before_create :generate_guid
   has_and_belongs_to_many :mycases, foreign_key: :user_id
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

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def sadmin?

      self.is_a?(Sadmin) 
    end


    def admin?

      self.is_a?(Admin) 
    end 

    def adminassistant?

      self.is_a?(Adminassistant) 
    end

     def attorney?

      self.is_a?(Attorney) 
    end
    def client?

      self.is_a?(Client) 
    end

    def full_name
      return self.first_name+" "+self.last_name
    end

  def self.search(search)
    where("name ILIKE? OR")
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