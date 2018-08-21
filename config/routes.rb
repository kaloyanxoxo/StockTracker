Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'welcome#index'
  get 'tracking_list', to: "users#my_tracks"
  get 'search_stock', to: "stocks#search"
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships
  get 'friends', to: "users#friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
end
