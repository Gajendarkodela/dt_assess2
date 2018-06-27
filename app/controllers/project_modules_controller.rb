class ProjectModulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :assign_model, only: [:show, :edit]

  def new
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
      redirect_to project_path(params[:project_id])
    end
  end
   
  def show
    @test_cases = @project_module.test_cases
    @test_case = TestCase.new
  end

  def edit
    
  end

  def update
    @project_module = ProjectModule.find(params[:id])

    if @project_module.update(module_params)
      redirect_to project_path(params[:project_id])
    end
  end
  
  def destroy
    @module = ProjectModule.find(params[:id])
    @module.destroy
    redirect_to project_path(params[:project_id])
  end
  
  
  private

  def module_params
    params.require(:project_module).permit(:module_name,:id)
  end

  def assign_model
    begin
      @project = Project.find(params[:project_id])
      @project_module = ProjectModule.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Record Not Gound"
      redirect_to project_project_modules_path
    end
  end

end
