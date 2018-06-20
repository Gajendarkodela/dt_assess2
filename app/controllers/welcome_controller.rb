class WelcomeController < ApplicationController
  def index
    @projects = Project.all.order(:ranking)
  end
end
