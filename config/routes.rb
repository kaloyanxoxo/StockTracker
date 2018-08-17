Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my_tracks', to: "users#my_tracks"
end
