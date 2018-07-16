class RegistrationsController < Devise::RegistrationsController
  layout: "welcome"
  private
   
  def sign_up_params
    params.require(:model).permit(:user_name,:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:model).permit(:user_name, :email, :password, :password_confirmation, :current_password)
  end

end
