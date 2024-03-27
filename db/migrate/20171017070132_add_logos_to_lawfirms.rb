class AddLogosToLawfirms < ActiveRecord::Migration[5.1]
  def change
    add_column :lawfirms, :logos, :string
  end
end
