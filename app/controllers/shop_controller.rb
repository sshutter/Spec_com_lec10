class ShopController < ApplicationController
    before_action :set_user


    def show_shop
        @shop_user = User.find(params[:id])
        @items = Item.where(user_id: @shop_user.id)

        if params[:id_buy] != nil
            buy_item = Item.find(params[:id_buy]) 
            if buy_item && buy_item.stock > 0
                buy_item.stock = buy_item.stock - 1  
                buy_item.save
                
                
                add_in = Inventory.create(user_id: @user.id, item_id: buy_item.id, price: buy_item.price)
                
            end
        end
    end
    

    def set_user
        @user = User.find(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name, :login)
    end
end
