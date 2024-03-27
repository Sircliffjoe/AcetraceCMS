class Lawfirm < ApplicationRecord
  enum status: [:inactive, :active]
  has_many :transactions, dependent: :destroy
	belongs_to :admin, foreign_key: :admin_id
	has_many :clients, dependent: :destroy
  has_many :attorneys, dependent: :destroy
  has_many :adminassistants, dependent: :destroy
	has_many :mycases, dependent: :destroy
	mount_uploader :logos, LogosUploader
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  #validates :info, presence: true, length: { maximum: 100 }
  validates :phone_number, presence: true, length: { maximum: 11 }
 
  validates :state, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }


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
 

end


end
