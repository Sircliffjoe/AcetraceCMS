class IndexCommentsOnSlugToComments < ActiveRecord::Migration[5.1]
  def change
  	add_index :comments, :slug, :unique => true
  end
end
