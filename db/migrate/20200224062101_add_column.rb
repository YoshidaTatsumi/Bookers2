class AddColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :address, :address_city
  	add_column :users, :address_street, :string
  end
end
