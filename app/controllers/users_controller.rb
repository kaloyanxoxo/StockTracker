class UsersController < ApplicationController
    def my_tracks
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def friends
        
    end
    
end