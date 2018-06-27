class WelcomeController < ApplicationController
  def index
    @projects = Project.search(params[:page])
  end
end
