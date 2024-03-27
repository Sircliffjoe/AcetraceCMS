class Task < ApplicationRecord
  belongs_to :mycase
  belongs_to :taskter, polymorphic: true

  mount_uploader :document, DocumentUploader
 

     extend FriendlyId
  
    friendly_id :generate_caseNo, use: [:slugged, :history, :finders]
   



def generate_caseNo
        String.random(25, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end



end
