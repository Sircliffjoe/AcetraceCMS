class Posts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :poster_id, :integer 
  	add_column :posts, :poster_type, :string
  	add_index(:posts, [:poster_type, :poster_id])
  end
end
