class AddStepsToTestCases < ActiveRecord::Migration[5.1]
  def change
    add_column :test_cases, :steps, :text
  end
end
