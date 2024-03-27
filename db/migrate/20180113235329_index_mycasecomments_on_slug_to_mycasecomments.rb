class IndexMycasecommentsOnSlugToMycasecomments < ActiveRecord::Migration[5.1]
  def change
  	add_index :mycasecomments, :slug, :unique => true
  end
end
