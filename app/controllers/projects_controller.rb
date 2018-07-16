class ProjectsController < ApplicationController
  before_action :find_project, only: [:show,:edit,:update, :destroy]

  def index
    @projects = Project.all
    respond_to do |format|
      format.xml { render(xml: @projects ) }
      format.json{ render(json: @projects )}
      format.html
    end
  end

  def show 
    @modules = @project.project_modules
    @project_module = @project.project_modules.first || ProjectModule.new
    if @modules.count>0
      @test_cases = @modules.first.test_cases 
    end
    @test_case = TestCase.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) 
    if @project.save
      @projects = Project.all.order(:ranking)
      redirect_to root_path,notice: "Project created"
    end
  end

  def edit
    @modules = @project.project_modules
   end

  def update
    if @project.update(project_params)
      redirect_to @project ,notice:"Project updated successfully"
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path,notice: "Project is deleted"
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

end
