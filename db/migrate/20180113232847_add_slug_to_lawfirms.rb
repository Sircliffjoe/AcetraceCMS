class AddSlugToLawfirms < ActiveRecord::Migration[5.1]
  def change
    add_column :lawfirms, :slug, :string
  end
end
