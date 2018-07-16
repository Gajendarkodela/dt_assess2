class CreatePrisons < ActiveRecord::Migration[5.1]
  def change
    create_table :prisons do |t|
      t.string :prison_name

      t.timestamps
    end
  end
end
