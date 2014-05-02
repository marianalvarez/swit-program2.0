class ChangeColumnName < ActiveRecord::Migration
  
  	def change
		rename_column :users, :encrypt_password, :password_digest
	end
 
end
