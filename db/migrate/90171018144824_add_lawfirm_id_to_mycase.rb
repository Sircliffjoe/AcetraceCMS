class AddLawfirmIdToMycase < ActiveRecord::Migration[5.1]
  def change
    add_column :mycases, :lawfirm_id, :integer
  end
end
