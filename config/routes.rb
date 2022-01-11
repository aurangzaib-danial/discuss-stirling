Rails.application.routes.draw do  
  
  devise_for(
    :users, 
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" },
    controllers: { 
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  )

  root "main#index"

  # get "sign-up", to: "registrations#new"
  # post "sign-up", to: "registrations#create"


  namespace :users do
    get "select-account", to: "select_account#new"
    patch "select-account", to: "select_account#update"
  end

  # get "login", to: "sessions#new"
  # post "login", to: "sessions#create"

  # delete "logout", to: "sessions#destroy"

  # get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"

  # get "password/reset", to: "password_resets#new"
  # post "password/reset", to: "password_resets#create"
  # get "password/reset/edit", to: "password_resets#edit"
  # patch "password/reset/edit", to: "password_resets#update"


  resources :questions, only: [:create]
  get "/questions/ask", to: "questions#ask", as: "ask_question"
end
