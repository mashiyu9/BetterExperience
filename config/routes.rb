Rails.application.routes.draw do
  root to: "game_rooms#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get  "privacy_policy/index"
  resources :users, only: %i!show!
  resources :game_rooms, only: %i!index new create edit update show destroy!
  get 'rakuten_search' => 'game_rooms#search'
  resources :participants, only: %i! create update destroy!
  resources :game_room_messages, only: %i! create destroy!


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
