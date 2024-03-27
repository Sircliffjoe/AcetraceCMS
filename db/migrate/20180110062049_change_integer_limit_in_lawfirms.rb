class ChangeIntegerLimitInLawfirms < ActiveRecord::Migration[5.1]
  def change
  	change_column :lawfirms, :phone_number, :integer, limit: 8
  end
end
