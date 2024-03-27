class CreateBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :billings do |t|
      t.float :cost
      t.text :description
      t.string :payment
      t.references :mycase, foreign_key: true

      t.timestamps
    end
  end
end
