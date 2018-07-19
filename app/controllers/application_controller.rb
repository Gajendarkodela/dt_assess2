class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout :layout_by_resource
  add_flash_types :type

  private

  def layout_by_resource
    if devise_controller?
      "application"
    else
      "application"
    end
  end
  


end
