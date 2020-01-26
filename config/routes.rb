Rails.application.routes.draw do
  resources :users, only: %i!new create edit update show destroy!
  resources :game_rooms, only: %i!index new create edit update show destroy!
end
