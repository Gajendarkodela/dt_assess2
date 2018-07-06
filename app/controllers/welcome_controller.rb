class WelcomeController < ApplicationController
<<<<<<< 5a6446cd5e2fbc5e626f8caf113d98726bbf5d22
=======
	before_action :authenticate_model!
	protect_from_forgery prepend: true
>>>>>>> User Login
  def index
    @project = Project.new
    @projects = Project.search(params[:no_page],params[:page])
  end
end
