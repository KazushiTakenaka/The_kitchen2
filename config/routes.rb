Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :users, only: [:show, :edit, :update]
  get '/users/:id/', to: 'users#list', as: 'list'
  get 'likes' => 'likes#index'
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
