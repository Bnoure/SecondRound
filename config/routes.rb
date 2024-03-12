Rails.application.routes.draw do
  get 'consoles/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  get 'pages/noure'

  get 'pages/nour'
  get 'pages/emma'
  get 'pages/xavier'
  get 'pages/dashboard'
  resources :battles, only: [:index, :show, :new, :create, :edit, :destroy] do
    member do
      patch 'set_winner'
    end
  end

  resources :games do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show]
  resources :stores, only: [:index, :show]

 get 'location', to: 'users#get_current_address'


  # Defines the root path route ("/")
  # root "posts#index"

end
