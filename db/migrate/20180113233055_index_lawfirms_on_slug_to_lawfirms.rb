class IndexLawfirmsOnSlugToLawfirms < ActiveRecord::Migration[5.1]
  def change
  	add_index :lawfirms, :slug, :unique => true
  end
end
