class Transaction < ApplicationRecord
  belongs_to :lawfirm, foreign_key: :lawfirm_id
end
