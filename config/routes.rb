Rails.application.routes.draw do 

  root "main#index" 
  
  devise_for(
    :users, 
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" },
    controllers: { 
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions'
    }
  )

  namespace :users do
    get "select-account", to: "select_account#new"
    patch "select-account", to: "select_account#update"
  end


  get "/questions/ask", to: "questions#ask", as: "ask_question"
  resources :questions, except: :new do
    resources :answers, only: :create
  end
  
end
