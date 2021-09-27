Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about"
  resources :users, only: [:show, :index, :edit, :update,]
  resources :books, only: [:create, :index, :edit, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments
  end
end