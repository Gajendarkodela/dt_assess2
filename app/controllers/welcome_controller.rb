class WelcomeController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.search(params[:no_page],params[:page])
  end
end
