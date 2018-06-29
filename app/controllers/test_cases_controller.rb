class TestCasesController < ApplicationController
  def new
    @test_case = TestCase.new
    @module = ProjectModule.find(params[:project_module_id])
  end

  def create
    @testcase =TestCase.new(test_case_params)
    @testcase.project_module_id = params[:project_module_id]
    if @testcase.save
      redirect_to project_module_path(params[:project_module_id]),notice:"TestCase is created"
    end
  end

  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.destroy
    redirect_to project_module_path(@test_case.project_module),notice:"TestCase is Deleted."
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
      redirect_to project_project_module_path(params[:project_id],params[:project_module_id],[:id]),notice:"TestCase is updated."
    end
  end

  private 
  def test_case_params
    params.require(:test_case).permit(:title,:description,:id)
  end
end
