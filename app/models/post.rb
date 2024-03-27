class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :poster, polymorphic: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :body, presence: true, length: { maximum: 10000 }
  mount_uploader :file, FileUploader
   
  
       extend FriendlyId
  
    friendly_id :generate_caseNo, use: [:slugged, :history, :finders]

def generate_caseNo
        String.random(30, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end


end
