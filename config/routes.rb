Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users
  

  post '/items/new' => 'items#create'
end
