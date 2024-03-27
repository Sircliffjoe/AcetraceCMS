class AddInfoToLawfirms < ActiveRecord::Migration[5.1]
  def change
    add_column :lawfirms, :info, :text
  end
end
