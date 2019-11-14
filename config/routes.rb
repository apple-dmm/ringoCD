Rails.application.routes.draw do
  devise_for :admins
  # 管理者
  namespace :admin do
    resources :contacts, only: [:create, :index, :show]
    resources :reviews, only: [:edit, :update, :destroy]
    resources :reviews, only: [:edit, :update, :destroy]
    resources :labels, only: [:create, :edit, :update, :new, :destroy]
    resources :categories, only: [:create, :edit, :update, :new, :destroy]
    resources :artists, only: [:create, :edit, :update, :new, :destroy]
    resources :orders, only: [:show, :index]
    resources :arrivals, only: [:new, :create, :index]
    resources :items, only: [:show, :edit, :new, :create, :update, :index, :destroy]
    resources :users, only: [:show, :edit, :update, :index, :destroy]
  end
  # ユーザー
  devise_for :users
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
  resources :users, only: [:edit, :update, :show]
end
