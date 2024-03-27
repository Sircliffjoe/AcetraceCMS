class AddDocumentToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :document, :json
  end
end
