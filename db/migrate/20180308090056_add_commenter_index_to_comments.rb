class AddCommenterIndexToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :commenter_id, :integer 
  	add_column :comments, :commenter_type, :string
  	add_index(:comments, [:commenter_type, :commenter_id])

  end
end
