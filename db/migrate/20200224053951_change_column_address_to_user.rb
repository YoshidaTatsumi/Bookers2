class ChangeColumnAddressToUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :addrerss, :address
  end
end
