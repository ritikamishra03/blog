Rails.application.routes.draw do
  # devise_for :installs
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
  namespace :api do
    resources :users 
  end
  resources :users
  #   resources :articles
  # end
  get '/search', to:"users#search"
  
end
