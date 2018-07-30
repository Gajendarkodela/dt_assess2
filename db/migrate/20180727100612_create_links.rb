class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :file
      t.references :test_case
      t.timestamps
    end
  end
end
