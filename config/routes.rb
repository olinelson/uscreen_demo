Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"

  resources :offers
  resources :videos
  resource :session
  resource :registration
  resources :passwords, param: :token
  resources :users, only: [ :show ]
end
