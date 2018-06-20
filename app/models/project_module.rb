class ProjectModule < ApplicationRecord
 has_many :test_cases, inverse_of: :project_module , dependent: :destroy
  belongs_to :project 
  validates :module_name,uniqueness:{scope: :project_id}
end
