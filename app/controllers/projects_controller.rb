class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @project = Project.new(project_params)
    if @project.save
      @projects = Project.all.order(:ranking)
     end
  end
  
  def new
    @project = Project.new
  end

  def index
  end
   
  def show
    @project = Project.find(params[:id])
    @modules = @project.project_modules
    @module = ProjectModule.new

  end

  def update
    @project = Project.find(params[:id])
    if (@project.update(project_params))
      redirect_to @project
    end
  end

  def destroy
    @project = Project.find(params[:id])
     @project.destroy
     redirect_to root_path
  end
  private
  def project_params
    params.require(:project).permit(:name,:ranking,:details)
  end

  


end
