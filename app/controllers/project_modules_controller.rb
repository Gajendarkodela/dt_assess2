class ProjectModulesController < ApplicationController
  before_action :assign_model, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @project_module = ProjectModule.new
  end

  def index 
    @project = Project.find(params[:project_id])
    @project_modules = @project.project_modules
  end

  def create
    @project_module = ProjectModule.new(module_params)
    @project_module.project_id = params[:project_id]
    if @project_module.save
      redirect_to project_path(params[:project_id]),notice: "Module created successfully"
    end
  end
   
  def show
    @test_cases = @project_module.test_cases
    @test_case = TestCase.new
  end

  def edit; end

  def update
    if @project_module.update(module_params)
      redirect_to project_path(@project_module.project),notice: "Module updated successfully"
    end
  end
  
  def destroy
    @project_module.destroy
    redirect_to project_path(@project_module.project),notice: "Module Deleted successfully"
  end
  
  
  private

  def module_params
    params.require(:project_module).permit(:module_name,:id)
  end

  def assign_model
    begin
      @project_module = ProjectModule.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Record Not Found"
      redirect_to project_project_modules_path
    end
  end

end
