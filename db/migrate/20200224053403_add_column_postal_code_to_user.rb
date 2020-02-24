class AddColumnPostalCodeToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :postal_code, :string
  	add_column :users, :addrerss, :text
  end
end
