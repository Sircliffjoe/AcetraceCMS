class Billing < ApplicationRecord
	enum status: [:unapproved, :approved]
  belongs_to :mycase
  belongs_to :poster, polymorphic: true
  mount_uploader :payment, PaymentUploader # Tells rails to use this uploader for this model.
 
end
