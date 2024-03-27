class AddSlugToMycasecomments < ActiveRecord::Migration[5.1]
  def change
    add_column :mycasecomments, :slug, :string
  end
end
