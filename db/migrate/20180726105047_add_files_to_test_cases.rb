class AddFilesToTestCases < ActiveRecord::Migration[5.1]
  def change
    add_column :test_cases, :files, :JSON
  end
end
