Rails.application.routes.draw do
  
  root "main#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"
  
  get "select-account", to: "select_account#new"
  patch "update-account-type", to: "select_account#update"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "sign-out", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
end
