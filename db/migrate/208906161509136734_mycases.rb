class Mycases < ActiveRecord::Migration[5.1]
  def change
  	  create_join_table :mycases, :users do |t|
      t.index [:mycase_id, :user_id]
      t.index [:user_id, :mycase_id]
    end
    
  end
end
