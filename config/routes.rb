Rails.application.routes.draw do
  # get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update]
  get 'likes' => 'likes#index'
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
