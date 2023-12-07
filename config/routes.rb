Rails.application.routes.draw do
  devise_for :users do
    get 'logout' => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
  get "search", to: 'profiles#search'
  patch "swipe_left", to: "matches#swipe_left"
  patch "swipe_right", to: "matches#swipe_right"
  post "pop_up_message", to: "messages#pop_up_message"

  # Defines the root path route ("/")
  # root "profiles#index"
  root "profiles#index"

  resources :profiles, only: %i[index show new create edit update] do
    resources :offers, only: %i[new create show]
  end
  resources :offers, only: %i[edit update destroy]
  resources :matches, only: %i[index show create] do
    resources :messages, only: %i[create]
  end
end
