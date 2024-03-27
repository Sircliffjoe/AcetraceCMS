class AddUserToBillings < ActiveRecord::Migration[5.1]
  def change
  	add_column :billings, :poster_id, :integer 
  	add_column :billings, :poster_type, :string
  	add_index(:billings, [:poster_type, :poster_id])
  end
end
