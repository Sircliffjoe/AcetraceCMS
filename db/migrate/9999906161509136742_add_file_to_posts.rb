class AddFileToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :file, :string
  end
end
