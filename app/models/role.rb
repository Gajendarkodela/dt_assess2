class Role < ApplicationRecord
	belongs_to :project
	belongs_to :user

	validates :user_id,uniqueness: {scope: :project_id}

	def self.find_role(project_id,user_id)
		where('project_id=? and user_id=?',project_id, user_id).first
	end
end
