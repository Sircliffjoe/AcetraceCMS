class AddAvatarsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatars, :string
  end
end
