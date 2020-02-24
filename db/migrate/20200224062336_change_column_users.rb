class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :address_city, :string
  end
end
