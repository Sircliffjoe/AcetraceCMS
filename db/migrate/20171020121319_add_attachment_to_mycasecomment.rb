class AddAttachmentToMycasecomment < ActiveRecord::Migration[5.1]
  def change
    add_column :mycasecomments, :attachment, :json
  end
end
