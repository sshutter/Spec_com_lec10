class MainController < ApplicationController
  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u && u.authenticate(params[:password])
      redirect_to main_user_item_path
      session[:logged_in] = true
      session[:username] = u.name
      session[:user_id] = u.id
    else
      redirect_to main_login_path, alert: 'Wrong Login or Password'
    end
  end

  def inventories
    @inventories = Inventory.where(user_id: session[:user_id])

  end

  def destroy
  end

  def user_item
    user_id = User.where(name: session[:username])
    @items = Item.where(user_id: user_id)
  end

  
end
