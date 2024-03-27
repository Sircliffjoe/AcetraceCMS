class AddEntityToMycases < ActiveRecord::Migration[5.1]
  def change
    add_column :mycases, :entity, :string
    add_column :mycases, :company_name, :string
    add_column :mycases, :rc, :string
    add_column :mycases, :rep_first, :string
    add_column :mycases, :rep_last, :string
    add_column :mycases, :f_name, :string
    add_column :mycases, :l_name, :string
    add_column :mycases, :company_spec, :string
  end
end
