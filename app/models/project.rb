class Project < ApplicationRecord
  has_many :roles,dependent: :destroy
  has_many :users,through: :roles
  has_many :project_modules, inverse_of: :project , dependent: :destroy

  after_create :add_tasks

  
  validates :name, uniqueness: true,presence: true,length: { maximum: 4}
  validates :ranking,uniqueness: true,presence: true, numericality: { greater_than:0 }

  scope :project_admin, -> { joins(:roles).where("roles.role = 'Project Admin'") }
  scope :project_member, -> { joins(:tasks).where("roles.role = 'Project Member'") } 

  def self.search(no_page,page)
      paginate(page: page, per_page:no_page || 9).order('ranking ASC') 
  end
  
  def un_assigned_users(user)
    User.includes(:roles).references(:roles).
    where("(roles.project_id <> ? && roles.user_id <> ?) || roles.project_id is null",self.id,user.id)
  end
  def add_tasks
  	  
  end

end
