Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :index, :edit, :show, :destroy, :update]
  resources :users, only: [:show, :index, :edit, :update,]
  root to: "homes#top"
  get "/home/about" => "homes#about"

end