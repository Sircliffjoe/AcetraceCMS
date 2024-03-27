class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
     
      t.integer :amount, :integer, limit: 8
      t.integer :lawfirm_id
      t.date :expires_on
      t.string :channel
      t.string :status
      t.string :reference
      t.string :gateway_response
      t.string :customer_code
      t.string :currency
   end   
end
 end