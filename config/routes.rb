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
    resources :arrivals, only: [:new, :create, :index, :edit]
    resources :items, only: [:show, :edit, :new, :create, :update, :index, :destroy]
    get 'items/autocomplete_artist/:term' => 'items#autocomplete_artist'
    get 'items/autocomplete_category/:term' => 'items#autocomplete_category'
    get 'items/autocomplete_label/:term' => 'items#autocomplete_label'
    resources :users, only: [:show, :edit, :update, :index, :destroy]
  end
  # ユーザー
  devise_for :users
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  root to: 'items#index'
  resources :cart_items, only: [:create, :destroy, :index, :update]
  resources :orders, only: [:create, :index, :new]
  get 'orders/confirm' => 'orders#confirm', as:'confirm_order'
  resources :addresses, only: [:create, :update, :destroy]
  resources :credits, only: [:create]
  resources :reviews, only: [:new, :create]
  resources :contacts, only: [:create, :new]
  resources :users, only: [:edit, :update, :show]
  resources :favorites, only: [:index]
  delete 'favorites/destroy_all' => 'favorites/destroy_all', as: 'destroy_all'
  resources :items, only: [:index, :show] do
  resources :favorites, only: [:create, :destroy]
end
end
