class Mycasecomments < ActiveRecord::Migration[5.1]
  def change

  	add_column :mycasecomments, :mycasecommenter_id, :integer 
  	add_column :mycasecomments, :mycasecommenter_type, :string
  	add_index(:mycasecomments, [:mycasecommenter_type, :mycasecommenter_id], :name => 'casements')

  	add_column :tasks, :taskter_id, :integer 
  	add_column :tasks, :taskter_type, :string
  	add_index(:tasks, [:taskter_type, :taskter_id])
  end
end
