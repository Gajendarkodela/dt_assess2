class ProjectsController < ApplicationController
  before_action :find_project, except: [:index,:new,:create]

  before_action :authenticate_user!
  before_action :authenticate_admin,only: [:create]

  protect_from_forgery prepend: true

  def index
    @project = Project.new
    @projects = current_user.projects.search(params[:no_page],params[:page])
    respond_to do |format|
      format.xml { render(xml: @projects ) }
      format.json{ render(json: @projects )}
      format.html
    end
    render :layout => 'welcome'
  end

  def show 
    @modules = @project.project_modules
    @project_module = @project.project_modules.first || ProjectModule.new
    if @modules.count>0
      @test_cases = @modules.first.test_cases 
      @test_case = @test_cases.first
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) 
    if @project.save
      @projects = Project.all.order(:ranking)
      @make_admin = @project.roles.create(role:"Project Admin")
      @make_admin.user_id = current_user.id
      @make_admin.save
      redirect_to root_path,notice: "Project created",type:"success"
    end
  end

  def edit
    @modules = @project.project_modules
   end

  def update
    if @project.update(project_params)
      debugger
      redirect_to @project ,notice:"Project updated successfully",type:"success"
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path,notice: "Project is deleted",type:"success"
  end

  def setting
    @users = User.project_members
  end

  def assign_users
    @role = @project.roles.new
    @role.role = params[:role]
    @role.user_id = params[:user]
    if @role.save
      redirect_to setting_project_path(@project)
    else
      redirect_to setting_project_path(@project),
      notice:"Already assigned",
      type:"error"
    end
  end

  def remove_user
    @roles = @project.roles.where(user_id: params[:user_id])
    if @roles.delete_all
     redirect_to setting_project_path(@project) 
    end
  end

  private

  def find_project
    begin
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Record Not Found"
      @projects = Project.all
      redirect_to projects_path
    end  
  end
  
  def project_params
    params.require(:project).permit(:name,:ranking,:details)
  end

  def authenticate_admin
    unless current_user.roles.where(role: 'Project Admin').present?
      flash[:notice] = "Only admin can access users page"
      redirect_to root_path
    end
  end
  
end
