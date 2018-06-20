class CreateProjectModules < ActiveRecord::Migration[5.1]
  def change
    create_table :project_modules do |t|
      t.string :module_name
      t.boolean :deleted
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
