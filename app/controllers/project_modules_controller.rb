class ProjectModulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @project_module = ProjectModule.new(module_params)
    @project_module.project_id = params[:project_id]
    if @project_module.save
      redirect_to request.referrer
    end
  end
   
  def show
    @project = Project.find(params[:project_id])
    @module = ProjectModule.find(params[:id])
    @test_cases =@module.test_cases
    @test_case = TestCase.new
  end

  def edit
    @project_module = ProjectModule.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @project_module = ProjectModule.find(params[:id])
    @project_module.update(module_params)
    redirect_to request.referrer
  end


  def destroy
    @module = ProjectModule.find(params[:id])
    @module.destroy
    redirect_to request.referrer,notice: "Module is successfully deleted" 
  end

  private
  def module_params
    params.require(:project_module).permit(:module_name,:id)
  end

end
