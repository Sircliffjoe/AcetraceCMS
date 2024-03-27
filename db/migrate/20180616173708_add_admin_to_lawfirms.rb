class AddAdminToLawfirms < ActiveRecord::Migration[5.1]
  def change
    add_column :lawfirms, :admin_id, :integer
  end
end
