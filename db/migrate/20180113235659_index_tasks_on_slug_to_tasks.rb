class IndexTasksOnSlugToTasks < ActiveRecord::Migration[5.1]
  def change
  	add_index :tasks, :slug, :unique => true
  end
end
