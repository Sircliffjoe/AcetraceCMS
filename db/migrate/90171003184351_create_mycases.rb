class CreateMycases < ActiveRecord::Migration[5.1]
  def change
    create_table :mycases do |t|
      t.string :caseNo
      t.string :slug
      t.string :client_name
      t.string :subject
      t.string :area_of_practice
      t.text :opponents
      t.string :assigned_attorney
      t.date :arrival_date
      t.date :due_date
      t.integer :status
      t.text :summary_of_brief
      t.string :add_judge
      t.string :add_court
     
    t.integer :admin_id, index: true

      t.timestamps
    end
    add_index :mycases, :slug, :unique => true
  end
end
