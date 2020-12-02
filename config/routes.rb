Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'login#login'

  # API Routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :activities, only: [ :index, :show, :update ] do
        resources :bookings, only: [ :create, :update ]
        resources :users, only: [ :index, :show ]
      end
      resources :users
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
