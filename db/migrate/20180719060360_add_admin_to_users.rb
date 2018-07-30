class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
  	 add_column :users, :role, "ENUM('Project Admin', 'Project Member') DEFAULT 'Project Member'"
  end
end
