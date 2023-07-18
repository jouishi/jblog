Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    collection do
      get 'search', to: 'users#search', as: 'search_users'
    end
  end

  resources :blogs do
    resources :comments, only: :create
  end

  get 'search', to: 'blogs#search', as: 'search_blogs'

  root to: 'blogs#index'
end
