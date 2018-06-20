class TestCase < ApplicationRecord
  belongs_to :project_module
  validates :title,uniqueness: true,presence: true
end
