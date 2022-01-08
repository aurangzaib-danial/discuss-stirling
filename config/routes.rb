Rails.application.routes.draw do  
  
  root "main#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"
  
  get "select-account", to: "select_account#new"
  patch "select-account", to: "select_account#update"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"


  resources :questions, only: [:create]
  get "/questions/ask", to: "questions#ask", as: "ask_question"
end
