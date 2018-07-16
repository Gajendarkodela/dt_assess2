class CreateCriminals < ActiveRecord::Migration[5.1]
  def change
    create_table :criminals do |t|
      t.text :name
      t.references :prison
      t.timestamps
    end
  end
end
