class AddStatusToBillings < ActiveRecord::Migration[5.1]
  def change
    add_column :billings, :status, :integer
  end
end
