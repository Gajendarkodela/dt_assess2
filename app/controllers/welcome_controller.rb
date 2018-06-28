class WelcomeController < ApplicationController
  def index
    @projects = Project.search(params[:page],params[:no_page])
  end
end
