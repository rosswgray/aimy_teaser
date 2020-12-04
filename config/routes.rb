Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'activities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  # API Routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login'
      resources :activities, only: [ :index, :show, :update ] do
        resources :bookings, only: [ :index, :show, :create, :update ]
        resources :users, only: [ :index, :show ]
      end
      resources :users, only: [ :index, :show ] do
        resources :bookings, only: [ :index, :show, :create, :update ]
      end
    end
  end

  # Website Routes
  resources :activities do
    resources :sessions
  end

  resources :bookings

  resources :users do
    resources :bookings
    resources :instructors
    resources :activities
  end
end
