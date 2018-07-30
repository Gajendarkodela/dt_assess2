class AddCreatedByToTestCase < ActiveRecord::Migration[5.1]
  def change
    add_column :test_cases, :created_by, :string
  end
end
