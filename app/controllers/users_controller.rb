class UsersController < ApplicationController
    before_action :auth_user
    
    def index
        @users = User.all_except(current_user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private
    def auth_user
        redirect_to new_user_session_path if !user_signed_in?
    end
end
