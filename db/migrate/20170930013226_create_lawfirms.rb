class CreateLawfirms < ActiveRecord::Migration[5.1]
  def change
    create_table :lawfirms do |t|
      t.string :name
      t.string :type_of_organization
      t.string :address
      t.string :email
      t.integer :phone_number
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
