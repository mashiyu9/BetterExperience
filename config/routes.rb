Rails.application.routes.draw do
  resources :users, only: %i!new create edit update show destroy!
end
