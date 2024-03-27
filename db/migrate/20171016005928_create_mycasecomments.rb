class CreateMycasecomments < ActiveRecord::Migration[5.1]
  def change
    create_table :mycasecomments do |t|
      t.text :content
      t.integer :mycase_id
      t.integer :user_id

      t.timestamps
    end
  end
end
