class IndexUsersOnSlugToUsers < ActiveRecord::Migration[5.1]
  def change
  	 add_index :users, :slug, :unique => true

  end
end
