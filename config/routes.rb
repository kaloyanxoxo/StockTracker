Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'tracking_list', to: "users#my_tracks"
  get 'search_stock', to: "stocks#search"
  resources :user_stocks, only: [:create, :destroy]
end
