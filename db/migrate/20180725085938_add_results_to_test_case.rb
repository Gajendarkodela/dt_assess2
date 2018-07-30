class AddResultsToTestCase < ActiveRecord::Migration[5.1]
  def change
    add_column :test_cases, :results, :text
  end
end
