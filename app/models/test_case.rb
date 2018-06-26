class TestCase < ApplicationRecord
  belongs_to :project_module
  validates :title,uniqueness:{scope: :project_module_id},presence: true
end
