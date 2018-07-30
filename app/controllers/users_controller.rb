class UsersController < ApplicationController
  before_action :authenticate_admin!,only: [:index,:edit,:update]
	layout 'welcome'
	def index
		@users= User.project_members
	end

	def show
      @user = User.find_by_id(params[:id])
    end

    def new
      @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to users_admin_index_path, notice: "Updated User."
        else
            render :edit
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_admin_index_path, 
            notice: "User succesfully created!",
            type:"success"
        else
            render :new
        end
    end

    def destroy
         @user = User.find(params[:id])
         if @user.destroy
            redirect_to users_admin_index_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name,:email, :password, :password_confirmation)
    end

    def authenticate_admin!
      unless current_user.roles.where(role: 'Project Admin').present?
        flash[:notice] = "Only admin can access users page"
        redirect_to root_path
      end
    end

end
