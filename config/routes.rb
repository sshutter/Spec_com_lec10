Rails.application.routes.draw do
  get 'main/login'
  resources :inventories
  resources :items
  resources :users
  resources :shops
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'main/create'
  get 'main/user_item', to: "main#user_item", as: "main_user_item"
  get 'shop/:id', to: "shop#show_shop", as: "show_shop"
  get 'main/inventories', to: "main#inventories", as:"main_inventories"
  # Defines the root path route ("/")
  # root "articles#index"
end
