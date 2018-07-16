class AddPriorityToTestCase < ActiveRecord::Migration[5.1]
  def change
  	add_column :test_cases, :priority, "ENUM('High', 'Medium', 'Low') DEFAULT 'Medium'"
  end
end
