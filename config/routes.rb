Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about"
  resources :books, only: [:create, :index, :edit, :show, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
end
