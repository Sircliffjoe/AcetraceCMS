class Mycasecomment < ApplicationRecord
  belongs_to :mycasecommenter, polymorphic: true
  belongs_to :mycase
  #delegate :first_name, to: :user, prefix: true, allow_nil: true
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   #validates :content, presence: true # Make sure the owner's name is present.
     #serialize :attachment, JSON # If you use SQLite, add this line.
   #has_attached_file :attachment,
   #:path => ':rails_root/public/uploads/attachment/:id/:basename.:extension'
    # attr_protected :attachment_file_name, :attachment_content_type, :attachment_file_size

   
   def filename
    File.basename(path)
  end


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
