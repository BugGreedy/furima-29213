Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders
    resources :comments, only: :create
  end
  resources :users
  

  post '/items/new' => 'items#create'
end
