class AddClientIdToMycase < ActiveRecord::Migration[5.1]
  def change
    add_column :mycases, :client_id, :integer
  end
end
