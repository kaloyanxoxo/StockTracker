class UsersController < ApplicationController
    def my_tracks
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def friends
        @friendship = current_user.friends
    end

    def search
        if params[:search_param].blank?
            flash.now[:danger] = "You have entered an empty string"
        else
            @users = User.search(params[:search_param])
            @users = current_user.except_current_users(@users)
            flash.now[:danger] = "No users match this search criteria" if @users.blank?
        end
        respond_to do |format|
            format.js { render partial: "friends/result" }
        end
    end   

    def add_friend
        @friend  = User.find(params[:friend])
        current_user.friendship.build(friend_id: @friend.id)
        if current_user.save
            flash[:notice] = "Friend was succesfully added"
            redirect_to friends_path
        end
    end
    
end