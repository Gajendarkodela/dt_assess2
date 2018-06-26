class TestCasesController < ApplicationController
  def new
    @test_case = TestCase.new
    @project = Project.find(params[:project_id])
    @module = ProjectModule.find(params[:project_module_id])
  end

  def create
    @module = ProjectModule.find(params[:project_module_id])
    @testcase =@module.test_cases.create(test_case_params)
    if @testcase.save
      redirect_to project_project_module_path(params[:project_id],params[:project_module_id])
    end
  end

  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.destroy
    redirect_to request.referrer
  end

  def show
    @test_case = TestCase.find(params[:id])

  end

  def edit
    @module = ProjectModule.find(params[:project_module_id])
    @project = Project.find(params[:project_id])
    @test_case = TestCase.find(params[:id])
  end

  def update
    @testcase = TestCase.find(params[:id])
    if @testcase.update(test_case_params)
      redirect_to request.referrer
    end
  end

  private 
  def test_case_params
    params.require(:test_case).permit(:title,:description,:id)
  end
end
