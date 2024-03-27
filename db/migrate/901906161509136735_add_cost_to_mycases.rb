class AddCostToMycases < ActiveRecord::Migration[5.1]
  def change
    add_column :mycases, :cost, :float
  end
end
