Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get '/users/:id/list', to: 'users#list', as: 'list'
  get 'likes' => 'likes#index'
  resources :recipes do
    resources :likes, only: [:create, :destroy]
    get :search, on: :collection
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
