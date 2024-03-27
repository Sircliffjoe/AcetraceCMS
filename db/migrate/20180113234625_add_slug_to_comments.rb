class AddSlugToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :slug, :string
  end
end
