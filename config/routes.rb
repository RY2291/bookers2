Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about"
  get "/search" => "searches#searches", as: "search"
  resources :users, only: [:show, :index, :edit, :update,] do
    resource :relationships, only: [:create, :destroy]
    #memberは個別idがあり
    get :followings, on: :member
    get :followers, on: :member
  end
    
  resources :books, only: [:create, :index, :edit, :show, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end