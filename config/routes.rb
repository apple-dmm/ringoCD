Rails.application.routes.draw do
  namespace :admin do
  resources :contacts, only: [:create, :index, :show]
  end

  namespace :admin do
  resources :reviews, only: [:edit, :update, :destroy]
  end

  namespace :admin do
  resources :labels, only: [:create, :edit, :update, :new, :destroy]
  end

  namespace :admin do
  resources :categories, only: [:create, :edit, :update, :new, :destroy]
  end

  namespace :admin do
  resources :artists, only: [:create, :edit, :update, :new, :destroy]
  end

  namespace :admin do
  resources :orders, only: [:show, :index]
  end

  namespace :admin do
  resources :arrivals, only: [:new, :create, :index]
  end

  namespace :admin do
  resources :items, only: [:show, :edit, :new, :create, :update, :index, :destroy]
  end

  namespace :admin do
  resources :users, only: [:show, :edit, :update, :index, :destroy]
  end

  get 'exit' => 'users#exit'
  resources :items, only: [:index, :show]
  root to: 'items#index'
  resources :cart_items, only: [:create, :destroy, :index, :update]
  resources :orders, only: [:create, :index, :new]
  get 'orders/:id/confirm' => 'orders#confirm'
  resources :addresses, only: [:create, :update, :destroy]
  resources :credits, only: [:create]
  resources :favorites, only: [:create, :destroy, :index]
  resources :reviews, only: [:new, :create]
  resources :contacts, only: [:create, :new]
  devise_for :end_users
  resources :users, only: [:edit, :update, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
