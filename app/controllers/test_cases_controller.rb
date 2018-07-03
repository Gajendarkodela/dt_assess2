class TestCasesController < ApplicationController
  before_action :find_test_case, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @test_case = TestCase.new
    @module = ProjectModule.find(params[:project_module_id])
  end

  def create
    @test_case =TestCase.new(test_case_params)
    @test_case.project_module_id = params[:project_module_id]
    if @test_case.save
      redirect_to project_module_path(params[:project_module_id]),notice:"TestCase is created"
    end
  end

  def edit; end

  def update
    if @test_case.update(test_case_params)
      redirect_to project_module_path(@test_case.project_module),notice:"TestCase is updated."
    end
  end

  def destroy
    @test_case.destroy
    redirect_to project_module_path(@test_case.project_module),notice:"TestCase is Deleted."
  end 
 
  private 
  def test_case_params
    params.require(:test_case).permit(:title,:description,:id)
  end

  def find_test_case
    @test_case = TestCase.find(params[:id])
  end
end
