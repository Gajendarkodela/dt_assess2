class ChangeDeletedInProjects < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :deleted, :boolean, :default => false
  end
end
