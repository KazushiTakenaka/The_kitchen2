Rails.application.routes.draw do
  # get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update]
  resources :likes, only: [:index, :create, :destroy]
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
