class AddStatusToLawfirms < ActiveRecord::Migration[5.1]
  def change
    add_column :lawfirms, :status, :integer
  end
end
