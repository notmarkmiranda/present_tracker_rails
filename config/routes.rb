Rails.application.routes.draw do

  root "pages#index"

  resources :family_members


  get  "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get  "/logout", to: "sessions#destroy", as: "logout"

  get  "/dashboard", to: "users#show", as: "user_dashboard"

  get "/errors/404", to: "errors#show", as: "error_404"
end
