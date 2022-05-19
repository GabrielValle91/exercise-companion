class UsersController < ApplicationController
    def index
        redirect_to root_path if !current_user
        @users = User.all_except(current_user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end
end
