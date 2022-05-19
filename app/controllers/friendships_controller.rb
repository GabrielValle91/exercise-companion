class FriendshipsController < ApplicationController

    def new
        friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
        friendship.save
        redirect_to users_path
    end

    def destroy
        friendship = Friendship.find_by(id: params[:id])
        if friendship 
            opposite_friendship = Friendship.find_by(user_id: friendship.friend_id, friend_id: current_user.id)
            if friendship.destroy && opposite_friendship
                opposite_friendship.destroy
            end
        end
        redirect_to users_path
    end
end