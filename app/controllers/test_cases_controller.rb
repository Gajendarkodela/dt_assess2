class TestCasesController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :find_test_case, except:[:create]
  before_action :find_project_module, only:[:new, :index, :create]

  def show ; end

  def new;end

  def index
    @project = @project_module.project
    @modules =  @project.project_modules
    @test_case = @test_cases.first 
  end

  def create
    @test_case =@project_module.test_cases.new(test_case_params)
    if @test_case.save
      redirect_to project_module_test_cases_path(@project_module),
      notice: "Successfully created",type: "success"
    end
  end

  def edit; end

  def update
    @project_module = @test_case.project_module
    if @test_case.update(test_case_params)
      @test_cases = @project_module.test_cases
      redirect_to project_module_test_cases_path(@project_module),
      notice:"Successfully Updated"
    end
  end

  def destroy
    @project_module = @test_case.project_module
    @test_cases = @project_module.test_cases
    if @test_case.destroy
      redirect_to project_module_test_cases_path(@project_module),
      notice:"Deleted Successfully",
      type:"error"
    end
  end 
 
  private 
  def test_case_params
    params.require(:test_case).permit(:title,:description,:id,:priority)
  end

  def find_test_case
    @test_case = params[:id] ? TestCase.find(params[:id]) : TestCase.new
    @project_module = @test_case.project_module
    @project = @project_module ? @project_module.project : ''
    @test_cases =  @project_module ? @project_module.test_cases: ''
  end

  def find_project_module
    @project_module = ProjectModule.find(params[:project_module_id])
    @test_cases = @project_module.test_cases
     
  end
end
