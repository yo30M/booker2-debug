Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about" => 'home#about', as: 'about'
  resources :books, only: [:index, :show, :create, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end