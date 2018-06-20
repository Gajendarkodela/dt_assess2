class Project < ApplicationRecord
   has_many :project_modules, inverse_of: :project , dependent: :destroy
   validates :name, uniqueness: true,presence: true
   validates :ranking,uniqueness: true,presence: true, numericality: { greater_than:0 }
end
