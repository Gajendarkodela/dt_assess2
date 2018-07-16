class AddKeyToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :key, :string
  end
end
