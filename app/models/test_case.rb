class TestCase < ApplicationRecord
  
  belongs_to :project_module
  has_many :links
  accepts_nested_attributes_for :links
  validates :title,uniqueness:{scope: :project_module_id},presence: true
end
