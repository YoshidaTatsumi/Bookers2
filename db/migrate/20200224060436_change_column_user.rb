class ChangeColumnUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :postal_code, :integer
  	add_column :users, :prefecture_code, :integer
  end
end
