Rails.application.routes.draw do
  get "session_users/new"
  get "session_users/create"
  get "users/new"
  get "users/create"
  get "home/index"
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
  resources :users, only: [ :new, :create, :show ]
  get "login", to: "session_users#new"
  post "login", to: "session_users#create"
  delete "logout", to: "session_users#destroy"
end
