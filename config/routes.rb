Rails.application.routes.draw do
  
  root "main#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  get "sign-in", to: "sessions#new"
  post "sign-in", to: "sessions#create"

  delete "sign-out", to: "sessions#destroy"

end
