class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :phone_number, :integer
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :lawfirm_id, :integer
  end
end
