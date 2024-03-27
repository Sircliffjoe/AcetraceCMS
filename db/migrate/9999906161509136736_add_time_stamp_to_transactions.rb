class AddTimeStampToTransactions < ActiveRecord::Migration[5.1]
  def change
  	add_column :transactions, :created_at, :timestamptz
  	add_column :transactions, :updated_at, :timestamptz
  end
end
