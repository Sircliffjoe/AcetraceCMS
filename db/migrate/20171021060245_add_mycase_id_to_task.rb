class AddMycaseIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :mycase_id, :integer
  end
end
