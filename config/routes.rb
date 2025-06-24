Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"

  resources :offers
  resources :videos
  resource :session
  resource :registration
  resources :passwords, param: :token
  resources :users, only: [ :show ]
  resource :onboarding do
    get "first_video", on: :collection, to: "onboardings#first_video"
    get "first_offer", on: :collection, to: "onboardings#first_offer"
  end
end
