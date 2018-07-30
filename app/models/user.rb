class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_name, uniqueness: true
  has_many :roles,dependent: :delete_all
  has_many :projects, through: :roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable

  scope :project_members, -> {where("id <> 13")}

  def admin?
  	# self.role == "Project Admin"
  end

  def assigned_role(project_id)
    roles.where(project_id: project_id).first.try(:role)
  end

end
