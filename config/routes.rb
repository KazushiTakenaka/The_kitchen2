Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'relationships' => 'relationships#index', as: 'relationship'
  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get '/users/:id/list', to: 'users#list', as: 'list'
  get 'likes' => 'likes#index'
  resources :recipes do
    resources :likes, only: [:create, :destroy]
    resources :posts, only: [:create]
    # create '/recipe/:id/posts', to: 'posts#create', as: 'recipe_posts'
    # destroy '/recipe/:id/posts', to: 'posts#destroy', as: 'recipe_posts'
    get :search, on: :collection
  end
  get 'tags/:id', to: 'recipes#tags', as: 'tags'
  resources :posts, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
