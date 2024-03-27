class AddEntityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :entity, :string
  end
end
