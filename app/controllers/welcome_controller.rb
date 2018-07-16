class WelcomeController < ApplicationController
	before_action :authenticate_user!
	protect_from_forgery prepend: true

	layout 'welcome'

  def index
    @project = Project.new
    @projects = Project.search(params[:no_page],params[:page])
  end
end
