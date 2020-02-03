Rails.application.routes.draw do
  root to: "game_rooms#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: %i!new create edit update show destroy!
  resources :game_rooms, only: %i!index new create edit update show destroy!
  resources :participants, only: %i! create update destroy!
  resources :game_room_messages, only: %i! show create update destroy!


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
