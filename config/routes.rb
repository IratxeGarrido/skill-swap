Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'profiles#index'

  resources :profiles, only: %i[index show new create] do
    resources :offers, only: %i[new create]
  end
  resources :offers, only: %i[edit update destroy]
  resources :matches, only: %i[index show create]
  resources :messages, only: %i[create]
end
