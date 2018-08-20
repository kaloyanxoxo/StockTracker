class UserStocksController < ApplicationController
    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.new_lookup(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:success] = "Stock #{@user_stock.stock.ticker} was successfully added to Tracking List"
        redirect_to tracking_list_path
    end

    def destroy
        stock = Stock.find(params[:id])
        @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        @user_stock.destroy
        flash[:notice] = "Stock was successfully removed from the list"
        redirect_to tracking_list_path
    end
    
end
