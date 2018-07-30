class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.column :role, "ENUM('Project Member', 'Project Admin')"
      t.timestamps
    end
  end
end
