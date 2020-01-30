Rails.application.routes.draw do
  root to: "game_rooms#index"
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # devise_scope :user do
  #   get "user/:id", to: "users/registrations#detail"
  #   get "signup", to: "users/registrations#new"
  #   get "login", to: "users/sessions#new"
  #   get "logout", to: "users/sessions#destroy"
  # end

  resources :users, only: %i!new create edit update show destroy!
  resources :game_rooms, only: %i!index new create edit update show destroy!
end
