Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :users

  post '/items/new' => 'items#create'

end
